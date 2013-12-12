//
//  LevelConfigs.h
//  Touch_Project
//
//  Created by Артур on 01.11.12.
//
//

#define LEVEL_NUM 1

#define GRENADE_NUM 50
#define BOX_NUM 50
#define MECH_NUM 50
#define BOOMERANG_NUM 50

#define vesVishenka 1.55
#define vesYagoda 0.75
#define vesMalina 0.68
#define vesLemon 2.2
#define vesPomidor 3.2
#define vesAnanas 3.5

//// LEVEL 1
#define time_1_1 0.6 //0.6
#define time_1_2 0.6 //0.6
#define time_1_3 0.5 //0.5

#define plan_1_1  i=CCRANDOM_0_1()*3
#define plan_1_2a  i=CCRANDOM_0_1()*4
#define plan_1_2b   if(i==2)i=CCRANDOM_0_1()*4;
#define plan_1_3a  i=CCRANDOM_0_1()*5
#define plan_1_3b   if(randomNumber%7==0)i=4;


//// LEVEL 2
#define time_2_1 0.4
#define time_2_2 0.45
#define time_2_3 0.5
#define time_2_4 0.55

#define plan_2_1 i=2;
#define plan_2_2 i=1;
#define plan_2_3 i=0;
#define plan_2_4 i=3;


//// LEVEL 3
#define time_3_1 0.35
#define time_3_2 0.25
#define time_3_3 0.25
#define time_3_4 0.25
#define time_3_5 0.15

#define plan_3_1a  i = CCRANDOM_0_1()*3+10;
#define plan_3_1b  if(i == 12)i = CCRANDOM_0_1()*3+10;

#define plan_3_2a  i = CCRANDOM_0_1()*3+10;
#define plan_3_2b  if(randomNumber%2==0)i = CCRANDOM_0_1()*3;

#define plan_3_3a  i = CCRANDOM_0_1()*3+10;
#define plan_3_3b  if(randomNumber%2==0)i = CCRANDOM_0_1()*4+1;

#define plan_3_4a  i = CCRANDOM_0_1()*3+10;
#define plan_3_4b  if(randomNumber%2==0)i = CCRANDOM_0_1()*5+1;

#define plan_3_5a  i = CCRANDOM_0_1()*3+10;
#define plan_3_5b  //

//// LEVEL 4
#define time_4_1 0.425
#define time_4_2 0.375
#define time_4_3 0.35
#define time_4_4 0.4
#define time_4_5 0.435
#define time_4_6 0.45

#define plan_4_1a  i = CCRANDOM_0_1()*6;
#define plan_4_1b  //

#define plan_4_2a  i = CCRANDOM_0_1()*6;
#define plan_4_2b  //

#define plan_4_3a  i = CCRANDOM_0_1()*4+1;
#define plan_4_3b  //

#define plan_4_4a  i = CCRANDOM_0_1()*4+2;
#define plan_4_4b  //

#define plan_4_5a  i = CCRANDOM_0_1()*3+3;
#define plan_4_5b  //

#define plan_4_6a  i = 5;
#define plan_4_6b  //


//// LEVEL 5
#define time_5_1 0.65
#define time_5_2 0.5
#define time_5_3 0.45
#define time_5_4 0.3
#define time_5_5 0.25
#define time_5_6 0.225

#define plan_5_1a  i = 5
#define plan_5_1b  //

#define plan_5_2a  i = 4;
#define plan_5_2b  //

#define plan_5_3a  i = 3;
#define plan_5_3b  //

#define plan_5_4a  i = 2;
#define plan_5_4b  //

#define plan_5_5a  i = 1;
#define plan_5_5b  //

#define plan_5_6a  i = 0;
#define plan_5_6b  //


//// LEVEL 6
#define time_6_1 0.5
#define time_6_2 0.475
#define time_6_3 0.45
#define time_6_4 0.375
#define time_6_5 0.35
#define time_6_6 0.325

#define plan_6_1 i = CCRANDOM_0_1()*6;
#define plan_6_2 i = CCRANDOM_0_1()*6;
#define plan_6_3 i = CCRANDOM_0_1()*6;
#define plan_6_4 i = CCRANDOM_0_1()*6;
#define plan_6_5 i = CCRANDOM_0_1()*6;
#define plan_6_6 i = CCRANDOM_0_1()*6;


//// LEVEL 7
#define time_7_1 0.4
#define time_7_2 0.35
#define time_7_3 0.3
#define time_7_4 0.325
#define time_7_5 0.22
#define time_7_6 0.16

#define plan_7_1a i=CCRANDOM_0_1()*3+13; //BUDILNIKI
#define plan_7_1b //

#define plan_7_2a i = CCRANDOM_0_1()*3;
#define plan_7_2b if(randomNumber%10==0)i = CCRANDOM_0_1()*3+13;

#define plan_7_3a i=CCRANDOM_0_1()*3+1;
#define plan_7_3b if(randomNumber%7==0)i = CCRANDOM_0_1()*3+13;

#define plan_7_4a i=CCRANDOM_0_1()*3+3;
#define plan_7_4b if(randomNumber%5==0)i = CCRANDOM_0_1()*3+13;

#define plan_7_5a i=CCRANDOM_0_1()*3+10;
#define plan_7_5b if(randomNumber%7==0)i = CCRANDOM_0_1()*3+13;

#define plan_7_6a i=CCRANDOM_0_1()*3+10; //ZOLOTIE
#define plan_7_6b if(randomNumber%7==0)i = CCRANDOM_0_1()*3+13

//// LEVEL 8
#define time_8_1 0.4
#define time_8_2 0.35
#define time_8_3 0.3
#define time_8_4 0.27
#define time_8_5 0.33
#define time_8_6 0.35

#define plan_8_1a i=CCRANDOM_0_1()*3;
#define plan_8_1b //

#define plan_8_2a i = CCRANDOM_0_1()*3+1;
#define plan_8_2b

#define plan_8_3a i=CCRANDOM_0_1()*4+1;
#define plan_8_3b

#define plan_8_4a i=CCRANDOM_0_1()*4+2;
#define plan_8_4b

#define plan_8_5a i=CCRANDOM_0_1()*3+3;
#define plan_8_5b

#define plan_8_6a i=CCRANDOM_0_1()*2+4;
#define plan_8_6b


//// LEVEL 9
#define time_9_1 0.45
#define time_9_2 0.35
#define time_9_3 0.3
#define time_9_4 0.275
#define time_9_5 0.25
#define time_9_6 0.2

#define plan_9_1a i=5;
#define plan_9_1b

#define plan_9_2a i=4;
#define plan_9_2b

#define plan_9_3a i=3;
#define plan_9_3b

#define plan_9_4a i=2;
#define plan_9_4b

#define plan_9_5a i=1;
#define plan_9_5b

#define plan_9_6a i=0;
#define plan_9_6b



//// LEVEL 10
#define time_10_1 0.125
#define time_10_2 0.225
#define time_10_3 0.25
#define time_10_4 0.27
#define time_10_5 0.32
#define time_10_6 0.32

#define plan_10_1a i = CCRANDOM_0_1()*3+10;
#define plan_10_1b //

#define plan_10_2a i = CCRANDOM_0_1()*3;
#define plan_10_2b if(randomNumber%3==0) i=CCRANDOM_0_1()*3+10;

#define plan_10_3a i=CCRANDOM_0_1()*3+1;
#define plan_10_3b if(randomNumber%2==0)i=CCRANDOM_0_1()*3+10;

#define plan_10_4a i=CCRANDOM_0_1()*3+3;
#define plan_10_4b if(randomNumber%2==0)i = CCRANDOM_0_1()*3+10;

#define plan_10_5a i=CCRANDOM_0_1()*3+10;
#define plan_10_5b if(randomNumber%7==0)i = CCRANDOM_0_1()*3+13;

#define plan_10_6a i=CCRANDOM_0_1()*3+10;
#define plan_10_6b if(randomNumber%5==0)i = CCRANDOM_0_1()*3+13

///////////////////////////////////////////////////////////////////////

/// 10 TYPES OF ATTACKS (levels:10-20)

//// LEVEL 11 /// Последовательная
#define time_11_1 0.355
#define time_11_2 0.375
#define time_11_3 0.395
#define time_11_4 0.415
#define time_11_5 0.465
#define time_11_6 0.485

#define plan_11_1a i = CCRANDOM_0_1()*3;
#define plan_11_1b

#define plan_11_2a i = CCRANDOM_0_1()*4+1;
#define plan_11_2b

#define plan_11_3a i = CCRANDOM_0_1()*5+1;
#define plan_11_3b

#define plan_11_4a  i = CCRANDOM_0_1()*5+1;
#define plan_11_4b

#define plan_11_5a  i = CCRANDOM_0_1()*4+2;
#define plan_11_5b

#define plan_11_6a  i = CCRANDOM_0_1()*3+3;
#define plan_11_6b

//// LEVEL 12 /// Одиночная
#define time_12_1 0.25
#define time_12_2 0.275
#define time_12_3 0.3
#define time_12_4 0.35
#define time_12_5 0.45
#define time_12_6 0.55

#define plan_12_1a i=0;
#define plan_12_1b

#define plan_12_2a i=1;
#define plan_12_2b

#define plan_12_3a i=2;
#define plan_12_3b

#define plan_12_4a i=3;
#define plan_12_4b

#define plan_12_5a i=4;
#define plan_12_5b

#define plan_12_6a i=5;
#define plan_12_6b

//// LEVEL 13 /// Монета+Фрукты (Монеты+Будильники)
#define time_13_1 0.325
#define time_13_2 0.225
#define time_13_3 0.235
#define time_13_4 0.27
#define time_13_5 0.32
#define time_13_6 0.2

#define plan_13_1a i=10;
#define plan_13_1b if(randomNumber%15==0) i=CCRANDOM_0_1()*3+10;

#define plan_13_2a i=10;
#define plan_13_2b if(randomNumber%5==0) i=CCRANDOM_0_1()*3+10;

#define plan_13_3a i=CCRANDOM_0_1()*3;
#define plan_13_3b if(randomNumber%4==0) i=CCRANDOM_0_1()*3+10;

#define plan_13_4a i=CCRANDOM_0_1()*3+1;
#define plan_13_4b if(randomNumber%4==0) i=CCRANDOM_0_1()*3+10;

#define plan_13_5a i=CCRANDOM_0_1()*3+2;
#define plan_13_5b if(randomNumber%5==0) i=CCRANDOM_0_1()*3+10;

#define plan_13_6a i=10;
#define plan_13_6b if(randomNumber%5==0) i=CCRANDOM_0_1()*3+10;

//// LEVEL 14 /// Рандомная с ускорением
#define time_14_1 0.6
#define time_14_2 0.55
#define time_14_3 0.45
#define time_14_4 0.425
#define time_14_5 0.4
#define time_14_6 0.375

#define plan_14_1a i=CCRANDOM_0_1()*6;
#define plan_14_1b

#define plan_14_2a i=CCRANDOM_0_1()*6;
#define plan_14_2b

#define plan_14_3a i=CCRANDOM_0_1()*6;
#define plan_14_3b

#define plan_14_4a i=CCRANDOM_0_1()*6;
#define plan_14_4b

#define plan_14_5a i=CCRANDOM_0_1()*6;
#define plan_14_5b

#define plan_14_6a i=CCRANDOM_0_1()*6;
#define plan_14_6b

//// LEVEL 15 /// Плюсуем 50%
#define time_15_1 0.325
#define time_15_2 0.275
#define time_15_3 0.275
#define time_15_4 0.275
#define time_15_5 0.325
#define time_15_6 0.345

#define plan_15_1a i=CCRANDOM_0_1()*2;
#define plan_15_1b if(randomNumber%2==0) i=0;

#define plan_15_2a i=CCRANDOM_0_1()*3+1;
#define plan_15_2b if(randomNumber%2==0) i=1;

#define plan_15_3a i=CCRANDOM_0_1()*4+1;
#define plan_15_3b if(randomNumber%2==0) i=2;

#define plan_15_4a i=CCRANDOM_0_1()*3+2;
#define plan_15_4b if(randomNumber%2==0) i=3;

#define plan_15_5a i=CCRANDOM_0_1()*4+2;
#define plan_15_5b if(randomNumber%2==0) i=4;

#define plan_15_6a i=CCRANDOM_0_1()*3+3;
#define plan_15_6b if(randomNumber%2==0) i=5;

//// LEVEL 16
#define time_16_1 0.45
#define time_16_2 0.45
#define time_16_3 0.45
#define time_16_4 0.45
#define time_16_5 0.45
#define time_16_6 0.45

#define plan_16_1a i=CCRANDOM_0_1()*3;
#define plan_16_1b

#define plan_16_2a i=CCRANDOM_0_1()*4;
#define plan_16_2b

#define plan_16_3a i=CCRANDOM_0_1()*3+1;
#define plan_16_3b

#define plan_16_4a i=CCRANDOM_0_1()*4+1;
#define plan_16_4b

#define plan_16_5a i=CCRANDOM_0_1()*3+2;
#define plan_16_5b

#define plan_16_6a i=CCRANDOM_0_1()*4+2;
#define plan_16_6b

//// LEVEL 17
#define time_17_1 0.325
#define time_17_2 0.225
#define time_17_3 0.25
#define time_17_4 0.27
#define time_17_5 0.32
#define time_17_6 0.32

#define plan_17_1a i=5;
#define plan_17_1b

#define plan_17_2a i=4;
#define plan_17_2b

#define plan_17_3a i=3;
#define plan_17_3b

#define plan_17_4a i=2;
#define plan_17_4b

#define plan_17_5a i=1;
#define plan_17_5b

#define plan_17_6a i=0;
#define plan_17_6b

//// LEVEL 18
#define time_18_1 0.15
#define time_18_2 0.15
#define time_18_3 0.15
#define time_18_4 0.23
#define time_18_5 0.27
#define time_18_6 0.32

#define plan_18_1a i=10;
#define plan_18_1b if(randomNumber%5==0) i=CCRANDOM_0_1()*2+11;

#define plan_18_2a i=CCRANDOM_0_1()*3+10
#define plan_18_2b if(randomNumber%7==0) i=CCRANDOM_0_1()*3+13;

#define plan_18_3a i=CCRANDOM_0_1()*3+10
#define plan_18_3b if(randomNumber%11==0) i=CCRANDOM_0_1()*3+13;
#define plan_18_3c if(randomNumber%2==0) i=CCRANDOM_0_1()*3;

#define plan_18_4a i=CCRANDOM_0_1()*3+10
#define plan_18_4b if(randomNumber%11==0) i=CCRANDOM_0_1()*3+13;
#define plan_18_4c if(randomNumber%3==0) i=CCRANDOM_0_1()*4+1;
#define plan_18_4d if(randomNumber%10==0) i=CCRANDOM_0_1()*2+3;

#define plan_18_5a i=CCRANDOM_0_1()*3+10
#define plan_18_5b if(randomNumber%11==0) i=CCRANDOM_0_1()*3+13;
#define plan_18_5c if(randomNumber%3==0) i=CCRANDOM_0_1()*3+2;
#define plan_18_5d if(randomNumber%10==0) i=CCRANDOM_0_1()*2+3;

#define plan_18_6a i=CCRANDOM_0_1()*3+10
#define plan_18_6b if(randomNumber%11==0) i=CCRANDOM_0_1()*3+13;
#define plan_18_6c if(randomNumber%3==0) i=CCRANDOM_0_1()*3+3;

//// LEVEL 19
#define time_19_1 0.275
#define time_19_2 0.225
#define time_19_3 0.325
#define time_19_4 0.27
#define time_19_5 0.325
#define time_19_6 0.37



#define plan_19_1a i=1;
#define plan_19_1b if(randomNumber%2==0)i=0;
#define plan_19_1c if(randomNumber%5==0)i=CCRANDOM_0_1()*4+10;

#define plan_19_2a i=2;
#define plan_19_2b if(randomNumber%2==0)i=3;
#define plan_19_2c if(randomNumber%5==0)i=CCRANDOM_0_1()*4+10;

#define plan_19_3a i=1;
#define plan_19_3b if(randomNumber%2==0)i=5;
#define plan_19_3c if(randomNumber%5==0)i=CCRANDOM_0_1()*4+10;

#define plan_19_4a i=4;
#define plan_19_4b if(randomNumber%2==0)i=2;
#define plan_19_4c if(randomNumber%5==0)i=CCRANDOM_0_1()*4+10;

#define plan_19_5a i=0;
#define plan_19_5b if(randomNumber%2==0)i=3;
#define plan_19_5c if(randomNumber%5==0)i=CCRANDOM_0_1()*4+10;

#define plan_19_6a i=4;
#define plan_19_6b if(randomNumber%2==0)i=5;
#define plan_19_6c if(randomNumber%5==0)i=CCRANDOM_0_1()*4+10;

//// LEVEL 20
#define time_20_1 0.325
#define time_20_2 0.225
#define time_20_3 0.2
#define time_20_4 0.285
#define time_20_5 0.17
#define time_20_6 0.15

#define plan_20_1a i=0;
#define plan_20_1b

#define plan_20_2a i=0;
#define plan_20_2b

#define plan_20_3a i=0;
#define plan_20_3b

#define plan_20_4a i=0;
#define plan_20_4b

#define plan_20_5a i=0;
#define plan_20_5b

#define plan_20_6a i=0;
#define plan_20_6b

/////////////////////////////////////////////////////////////////////
