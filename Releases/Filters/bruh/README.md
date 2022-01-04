# BRUH Filter
Yet another photography filter.

| BRUH |
|:---:|
| ![Screenshot_ks_porsche_919_hybrid_2016_spa_4-9-121-19-46-55](https://user-images.githubusercontent.com/90503800/138021319-66a4e078-ac44-4f75-9958-95148565e5b8.png "BRUH for base WFX") |

| BRUHg |
|:---:|
| ![Screenshot_ks_porsche_919_hybrid_2016_spa_4-9-121-19-43-12](https://user-images.githubusercontent.com/90503800/138021317-38969197-f35a-4463-9602-8f56b8ea7abd.png "BRUHg for base WFX (uses gamma fix)") |

| BRUHgp |
|:---:|
| ![Screenshot_ks_abarth_595ss_union_island_4-9-121-19-10-35](https://user-images.githubusercontent.com/90503800/138021314-050ad974-f466-4708-9f72-acee804e3414.png "BRUHgp based on BRUHg for Pure WFX") |

## Filter Notes
The name BRUH came from how bad the filter had originally looked.

**BRUH**

Use with Base WFX

**BRUHg**

Use with Base WFX and includes experimental CSP gamma fix

**BRUHgp**

Made for Pure WFX and includes experimental CSP gamma fix

**Nice Screenshot Settings for Accumulation DOF:**

https://acstuff.ru/s/MzTv4r

<details><summary>Notes for this particular preset</summary>
<li>Don't go below 1500 iterations in overall this is a gold way between quality and time (imo, but depends on your rig too so.. it's on you)</li>
<li>You can get overall iterations by multiplying each ENABLED acculumation module.</li>
<li>You can decide what acculumation motion blur, acculumation and set your numbers by your preferences</li>
<br>
Filter (.ini) settings for matching preview—edit whatever you want for better performance if you need:
<br><br>
<code>
[DOF]
ADAPTIVE_APERTURE_FACTOR=0<br>
APERTURE_BACK_LEVELS_NUMBER=10000<br>
APERTURE_FRONT_LEVELS_NUMBER=10000<br>
APERTURE_F_NUMBER=11<br>
APERTURE_PARAMETER=2<br>
APERTURE_SHAPE=7<br>
BACKGROUND_MASK_THRESHOLD=0<br>
BASE_FOV=75.000000<br>
EDGE_QUALITY=100<br>
ENABLED=1<br>
IMAGE_SENSOR_HEIGHT=0.240000<br>
QUALITY=100<br>
</code><br>
But <b>don't touch these</b>:
<br><br>
<code>
ADAPTIVE_APERTURE_FACTOR=0<br>
APERTURE_PARAMETER=2<br>
APERTURE_SHAPE=7 (5-7)<br>
BASE_FOV=75.000000<br>
IMAGE_SENSOR_HEIGHT=0.240000<br>
</code>
</details>
___

| Known issue with BRUHgp: |
|:---:|
| ![](https://user-images.githubusercontent.com/90503800/141662274-42dd693b-3235-4af7-8262-815aa2f1da42.PNG) |