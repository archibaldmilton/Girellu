#A3PP Config by demonized
#based on Sol Config
#CHANGELOG:
#v0.1 - release
import ac, acsys, sys, os, re, string, traceback, functools, configparser
ver = 'v0.1'
app = 0
file_plain = 0
filedata = 0
#sol_config.lua
sol_config = "system\\cfg\\ppfilters\\sol_custom_configs\\A3PP.lua"
sol_config_prefix = 'general'
sol_config_checkboxes = {}
sol_config_spinners = {}
sol_config_labels = []
sol_config_comments = {}
sol_config_valuetypes = {}
sol_config_functions = {}
sol_config_indexes = {}
#sol_config.ini
sol_config_ini_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "atrip_config.ini")
sol_config_ini = configparser.ConfigParser(inline_comment_prefixes=";")
#settings.ini
settings_ini_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), "settings", "settings.ini")
settings_ini = configparser.ConfigParser()
save_load_ini = True
page = []
pagination_spinner = 0

def is_number(s):
    return s.replace('.','',1).replace('-','',1).isdigit()

def is_int(s):
    return s.replace('-', '', 1).isdigit()

def is_bool(s):
    if s == 'true' or s == 'false':
        return True
    else:
        return False

def write_ini(prefix, name, arg):
    global sol_config_ini, sol_config_ini_path, sol_config_valuetypes, save_load_ini
    if save_load_ini:
        if not sol_config_ini.has_section(prefix):
            sol_config_ini.add_section(prefix)
        if sol_config_valuetypes[prefix][name].find('array') != -1:
            sol_config_ini[prefix][name] = arg + " ; (SAVE COMMA WHILE EDITING)"
        else:
            sol_config_ini[prefix][name] = arg
        with open(sol_config_ini_path, 'w', encoding='utf-8') as ini:
            sol_config_ini.write(ini)

def write_from_ini(prefix, name):
    global sol_config_indexes, sol_config_ini, sol_config_comments, filedata, save_load_ini, sol_config
    if save_load_ini:
        if name in sol_config_comments[prefix]:
            filedata[sol_config_indexes[prefix][name]] = name + ' = ' + sol_config_ini[prefix][name] + " --" + \
                                                         sol_config_comments[prefix][name] + "\n"
        else:
            filedata[sol_config_indexes[prefix][name]] = name + ' = ' + sol_config_ini[prefix][name] + "\n"
        with open(sol_config, 'w', encoding='utf-8') as file:
            file.writelines(filedata)
        return sol_config_ini[prefix][name]

def bool_change(prefix, varname,  name, value):
    global filedata, sol_config, sol_config_indexes, sol_config_comments, sol_config_valuetypes, sol_config_ini_path
    global sol_config_ini
    v = 'true' if value == 1 else 'false'
    if sol_config_valuetypes[prefix][varname].find('array') != -1:
        v += ','
    filedata[sol_config_indexes[prefix][varname]] = varname + " = " + v + "\n"
    with open(sol_config, 'w', encoding='utf-8') as file:
        file.writelines(filedata)
    write_ini(prefix, varname, v)

def spinner_change(type, prefix, name, *args):
    global sol_config_indexes, filedata, sol_config_comments, sol_config, sol_config_ini_path, sol_config_ini
    for arg in args:
        if type.find('float') != -1:
            arg /= 100
            arg = str('%.2f' % arg)
        else:
            arg = str(int(arg))
        if type.find('array') != -1:
            arg +=','
        if name in sol_config_comments[prefix]:
            filedata[sol_config_indexes[prefix][name]] = name + ' = ' + arg + " --" + sol_config_comments[prefix][name] + "\n"
        else:
            filedata[sol_config_indexes[prefix][name]] = name + ' = ' + arg + "\n"
        with open(sol_config, 'w', encoding='utf-8') as file:
            file.writelines(filedata)
        write_ini(prefix, name, arg)

def page_change(*args):
    global page, pagination_spinner
    for current_page in range(len(page)):
        if current_page == ac.getValue(pagination_spinner):
            for element in range(len(page[current_page])):
                ac.setVisible(page[current_page][element], 1)
        else:
            for element in range(len(page[current_page])):
                ac.setVisible(page[current_page][element], 0)

def acUpdate(delta_t):
    global app
    ac.setBackgroundOpacity(app, 0.8)

def acMain(ac_version):
    global app, sol_config, sol_config_checkboxes, sol_config_labels, sol_config_spinners, filedata, pagination_spinner
    global file_plain, sol_config_valuetypes, sol_config_comments, sol_config_prefix, sol_config_functions
    global sol_config_indexes, sol_config_ini, sol_config_ini_path, settings_ini, settings_ini_path, save_load_ini
    app = ac.newApp("A3PP Config")
    ac.setTitle(app, "A3PP Config " + ver)
    size_x = 425
    size_y = 720
    ac.setSize(app, size_x, size_y)
    ac.setBackgroundOpacity(app, 0.8)
    page.append([])
    sol_config_checkboxes[sol_config_prefix] = {}
    sol_config_valuetypes[sol_config_prefix] = {}
    sol_config_spinners[sol_config_prefix] = {}
    sol_config_comments[sol_config_prefix] = {}
    sol_config_indexes[sol_config_prefix] = {}
    x = 10
    y = 40
    ignore = False
    function_level = 0
    if not os.path.isfile(sol_config_ini_path):
        with open(sol_config_ini_path, 'w', encoding='utf-8') as ini:
            ini.write('')
    sol_config_ini.read(sol_config_ini_path)

    if not os.path.isfile(settings_ini_path):
        with open(settings_ini_path, 'w', encoding='utf-8') as ini:
            ini.write('')
    settings_ini.read(settings_ini_path)
    if settings_ini.has_option("GENERAL", 'save_load_ini'):
        save_load_ini = settings_ini.getboolean("GENERAL", "save_load_ini")

    with open(sol_config, 'r', encoding='utf-8') as file:
        file_plain = file.read()
    filedata = file_plain.splitlines(True)
    try:
        for idx, line in enumerate(filedata):
            if line == "function update_sol_custom_config()":
                return 0
            if idx != 0:
                if line.find("--<br>") != -1:
                    page.append([])
                    y = 40
                elif line.find("}") != -1:
                    sol_config_prefix = 'general'
                elif line.find("function") != -1 or line.find("if ") != -1:
                    ignore = True
                    function_level = 1
                if function_level > 0:
                    if line.find("end") != -1:
                        function_level -= 1
                else:
                    ignore = False
                if not ignore and not re.search(r"^--", line) and line.find('--') == -1 and line.find(
                        '=') != -1 and line.find('local ') == -1 \
                        and line.find('if ') == -1 and line.find('nopp__use_sol_without_postprocessing') == -1:
                    line_var = line.split("--", 1)
                    line_varname = line_var[0].split("=", 1)[0].strip()
                    line_varvalue = line_var[0].split("=", 1)[1].strip()
                    if 1 < len(line_var):
                        sol_config_comments[sol_config_prefix][line_varname] = line_var[1].strip()
                    if line_varvalue.find("{") != -1:
                        sol_config_prefix = line_varname
                        sol_config_spinners[sol_config_prefix] = {}
                        sol_config_valuetypes[sol_config_prefix] = {}
                        sol_config_comments[sol_config_prefix] = {}
                        sol_config_indexes[sol_config_prefix] = {}
                        sol_config_checkboxes[sol_config_prefix] = {}
                        sol_config_labels.append(ac.addLabel(app, line_varname.replace('__', ' ').replace('_', ' ')))
                        ac.setPosition(sol_config_labels[-1], x, y)
                        y += 20
                        page[-1].append(sol_config_labels[-1])
                    else:
                        sol_config_indexes[sol_config_prefix][line_varname] = idx
                        if save_load_ini and sol_config_ini.has_option(sol_config_prefix, line_varname) and line_varvalue != sol_config_ini[sol_config_prefix][line_varname]:
                            line_varvalue = write_from_ini(sol_config_prefix, line_varname)
                            ac.console('value [%s]%s = %s returned from ini' % (sol_config_prefix, line_varname, line_varvalue))
                        if line_varvalue.find(",") != -1:
                            sol_config_valuetypes[sol_config_prefix][line_varname] = 'array'
                            line_varvalue = line_varvalue.replace(",", "")
                        if y > size_y - 105:
                            page.append([])
                            y = 40
                        if is_bool(line_varvalue):
                            y += 11
                            if line_varname in sol_config_valuetypes[sol_config_prefix] and sol_config_valuetypes[sol_config_prefix][line_varname] == 'array':
                                sol_config_valuetypes[sol_config_prefix][line_varname] = 'array_bool'
                            else:
                                sol_config_valuetypes[sol_config_prefix][line_varname] = 'bool'
                            sol_config_checkboxes[sol_config_prefix][line_varname] = ac.addCheckBox(app, line_varname.replace('__', ' ').replace('_', ' '))
                            page[-1].append(sol_config_checkboxes[sol_config_prefix][line_varname])
                            ac.setSize(sol_config_checkboxes[sol_config_prefix][line_varname], 12, 12)
                            ac.setPosition(sol_config_checkboxes[sol_config_prefix][line_varname], x, y)
                            if line_varvalue == 'true':
                                ac.setValue(sol_config_checkboxes[sol_config_prefix][line_varname], 1)
                            else:
                                ac.setValue(sol_config_checkboxes[sol_config_prefix][line_varname], 0)
                            func = functools.partial(bool_change, sol_config_prefix, line_varname)
                            sol_config_functions[sol_config_prefix + line_varname] = func
                            ac.addOnCheckBoxChanged(sol_config_checkboxes[sol_config_prefix][line_varname],
                                                    sol_config_functions[sol_config_prefix + line_varname])
                            y += 14
                        elif is_number(line_varvalue):
                            y += 27
                            if line_varname in sol_config_valuetypes[sol_config_prefix] and sol_config_valuetypes[sol_config_prefix][line_varname] == 'array':
                                sol_config_valuetypes[sol_config_prefix][line_varname] = 'array_float'
                            else:
                                sol_config_valuetypes[sol_config_prefix][line_varname] = 'float'
                            if line_varname in sol_config_comments[sol_config_prefix] \
                                    and re.search(r"min=.*,max=.*", sol_config_comments[sol_config_prefix][line_varname]):
                                ranges = sol_config_comments[sol_config_prefix][line_varname].split(",")
                                range_min = float(ranges[0].split('=')[1])
                                range_max = float(ranges[1].split('=')[1])
                            else:
                                range_min = 0
                                range_max = 10
                            if sol_config_valuetypes[sol_config_prefix][line_varname] == 'int' or sol_config_valuetypes[sol_config_prefix][line_varname] == 'array_int':
                                sol_config_spinners[sol_config_prefix][line_varname] = ac.addSpinner(app, line_varname.replace('__', ' ').replace('_', ' '))
                                varvalue = int(line_varvalue)
                                ac.setRange(sol_config_spinners[sol_config_prefix][line_varname], int(range_min), int(range_max))
                            else:
                                sol_config_spinners[sol_config_prefix][line_varname] = ac.addSpinner(app, line_varname.replace('__', ' ').replace('_', ' ') + ', %')
                                varvalue = int(float(line_varvalue) * 100)
                                ac.setRange(sol_config_spinners[sol_config_prefix][line_varname], int(range_min * 100), int(range_max * 100))
                            page[-1].append(sol_config_spinners[sol_config_prefix][line_varname])
                            ac.setStep(sol_config_spinners[sol_config_prefix][line_varname], 1)
                            ac.setValue(sol_config_spinners[sol_config_prefix][line_varname], varvalue)
                            ac.setPosition(sol_config_spinners[sol_config_prefix][line_varname], 10, y)
                            ac.setSize(sol_config_spinners[sol_config_prefix][line_varname], size_x - 20, 20)
                            func = functools.partial(spinner_change, sol_config_valuetypes[sol_config_prefix][line_varname],
                                                     sol_config_prefix, line_varname)
                            sol_config_functions[sol_config_prefix + line_varname] = func
                            ac.addOnValueChangeListener(sol_config_spinners[sol_config_prefix][line_varname],
                                                        sol_config_functions[sol_config_prefix + line_varname])
                            y += 27
        pagination_spinner = ac.addSpinner(app, "Page")
        ac.setRange(pagination_spinner, 0, len(page) - 1)
        ac.setValue(pagination_spinner, 0)
        ac.setStep(pagination_spinner, 1)
        ac.setPosition(pagination_spinner, size_x / 2 - 50, size_y - 35)
        ac.setSize(pagination_spinner, 100, 20)
        ac.addOnValueChangeListener(pagination_spinner, page_change)
        page_change()
    except:
        ac.log("A3PP Config: Unexpected error:" + traceback.format_exc())
    return "atrip_config"

def acShutdown():
    pass