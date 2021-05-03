# ---------------------------------- 互 助 码 填 写 示 例 ----------------------------------

################################## 互助码填法示例 ##################################
## **互助码是填在My系列变量中的，ForOther系统变量中只要填入My系列的变量名即可，按注释中的例子拼接，以东东农场为例，如下所示。**
## **实际上东东农场一个账号只能给别人助力3次，我多写的话，只有前几个会被助力。但如果前面的账号获得的助力次数已经达到上限了，那么还是会尝试继续给余下的账号助力，所以多填也是有意义的。**
## **ForOther系列变量必须从1开始编号，依次编下去。**

# MyFruit1="e6e04602d5e343258873af1651b603ec"  # 这是Cookie1这个账号的互助码
# MyFruit2="52801b06ce2a462f95e1d59d7e856ef4"  # 这是Cookie2这个账号的互助码
# MyFruit3="e2fd1311229146cc9507528d0b054da8"  # 这是Cookie3这个账号的互助码
# MyFruit4="6dc9461f662d490991a31b798f624128"  # 这是Cookie4这个账号的互助码
# MyFruit5="30f29addd75d44e88fb452bbfe9f2110"  # 这是Cookie5这个账号的互助码
# MyFruit6="1d02fc9e0e574b4fa928e84cb1c5e70b"  # 这是Cookie6这个账号的互助码
# MyFruitA="5bc73a365ff74a559bdee785ea97fcc5"  # 这是我和别人交换互助，另外一个用户A的互助码
# MyFruitB="6d402dcfae1043fba7b519e0d6579a6f"  # 这是我和别人交换互助，另外一个用户B的互助码
# MyFruitC="5efc7fdbb8e0436f8694c4c393359576"  # 这是我和别人交换互助，另外一个用户C的互助码

# ForOtherFruit1="${MyFruit2}@${MyFruitB}@${MyFruit4}"   # Cookie1这个账号助力Cookie2的账号的账号、Cookie4的账号以及用户B
# ForOtherFruit2="${MyFruit1}@${MyFruitA}@${MyFruit4}"   # Cookie2这个账号助力Cookie1的账号的账号、Cookie4的账号以及用户A
# ForOtherFruit3="${MyFruit1}@${MyFruit2}@${MyFruitC}@${MyFruit4}@${MyFruitA}@${MyFruit6}"  # 解释同上，东东农场实际上只能助力3次
# ForOtherFruit4="${MyFruit1}@${MyFruit2}@${MyFruit3}@${MyFruitC}@${MyFruit6}@${MyFruitA}"  # 解释同上，东东农场实际上只能助力3次
# ForOtherFruit5="${MyFruit1}@${MyFruit2}@${MyFruit3}@${MyFruitB}@${MyFruit4}@${MyFruit6}@${MyFruitC}@${MyFruitA}"
# ForOtherFruit6="${MyFruit1}@${MyFruit2}@${MyFruit3}@${MyFruitA}@${MyFruit4}@${MyFruit5}@${MyFruitC}"


## ---------------------------------- 手 动 填 写 互 助 码 区 域 （不推荐！） ----------------------------------
## 以下为互助码的手动填写区域，为特定活动或临时活动填写的地方。现已可一键自动生成，只需运行export_sharecodes.sh按提示操作即可。

################################## 1. 定义东东农场互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyFruit1=""
MyFruit2=""
MyFruitA=""
MyFruitB=""

ForOtherFruit1=""
ForOtherFruit2=""


################################## 2. 定义东东萌宠互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyPet1=""
MyPet2=""
MyPetA=""
MyPetB=""

ForOtherPet1=""
ForOtherPet2=""


################################## 3. 定义种豆得豆互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyBean1=""
MyBean2=""
MyBeanA=""
MyBeanB=""

ForOtherBean1=""
ForOtherBean2=""


################################## 4. 定义东东工厂互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyJdFactory1=""
MyJdFactory2=""
MyJdFactoryA=""
MyJdFactoryB=""

ForOtherJdFactory1=""
ForOtherJdFactory2=""


################################## 5. 定义京喜工厂互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyDreamFactory1=""
MyDreamFactory2=""
MyDreamFactoryA=""
MyDreamFactoryB=""

ForOtherDreamFactory1=""
ForOtherDreamFactory2=""


################################## 6. 定义京东赚赚互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyJdzz1=""
MyJdzz2=""
MyJdzzA=""
MyJdzzB=""

ForOtherJdzz1=""
ForOtherJdzz2=""


################################## 7. 定义疯狂的JOY互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyJoy1=""
MyJoy2=""
MyJoyA=""
MyJoyB=""

ForOtherJoy1=""
ForOtherJoy2=""


################################## 8. 定义口袋书店互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyBookShop1=""
MyBookShop2=""
MyBookShopA=""
MyBookShopB=""

ForOtherBookShop1=""
ForOtherBookShop2=""


################################## 9. 定义签到领现金互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyCash1=""
MyCash2=""
MyCashA=""
MyCashB=""

ForOtherCash1=""
ForOtherCash2=""


################################## 10. 定义京喜农场互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
## 京喜农场助力码为 JSON 格式因此使用单引号，json 格式如下
## {"smp":"22bdadsfaadsfadse8a","active":"jdnc_1_btorange210113_2","joinnum":"1"}
## 助力码获取可以通过 bash jd.sh jd_get_share_code now 命令获取
## 注意：京喜农场 种植种子发生变化的时候，互助码也会变！！
MyJxnc1=''
MyJxnc2=''
MyJxncA=''
MyJxncB=''

ForOtherJxnc1=""
ForOtherJxnc2=""


################################## 11. 定义闪购盲盒互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MySgmh1=""
MySgmh2=""
MySgmhA=""
MySgmhB=""

ForOtherSgmh1=""
ForOtherSgmh2=""


################################## 12. 定义京喜财富岛互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyCfd1=""
MyCfd2=""
MyCfdA=""
MyCfdB=""

ForOtherCfd1=""
ForOtherCfd2=""



################################## 13. 定义京东手机狂欢城互助（选填） ##################################
## 具体填法及要求详见本文件最下方“互助码填法示例”
MyCarnivalcity1=""
MyCarnivalcity2=""
MyCarnivalcityA=""
MyCarnivalcityB=""

ForOtherCarnivalcity1=""
ForOtherCarnivalcity2=""

