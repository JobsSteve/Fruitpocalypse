//
//  Game.h
//  Touch_Project
//
//  Created by Артур on 04.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "BoxPowerUp.h"

@class AppDelegate;

@interface Game : CCLayer
{
    CGSize s;
    AppDelegate *delegate;
    
    
    CCLabelTTF *scoreLabel; // КОЛИЧЕСТВО УБИТЫХ (отображает)
    CCLabelTTF *countLabel; // КОЛИЧЕСТВО на ЭКРАНЕ
    CCLabelTTF *timerLabel; // текущее ВРЕМЯ 00:00:00 (формат)
    
    CCLabelTTF *gameoverLABEL; // GAMEOVER вылазит
    
    
    int score; //количество УБИТЫХ
    int index; // подсчет МИНУТ в timerLabel (ВРЕМЯ 00:00:00 формат)
    
    CCArray *fruitsArray; // массив ОБЪЕКТОВ
    NSArray *fruitTypes; // массив инициализированных (16)ОБЪЕКТОВ 0-15
    
    int xInt,yInt; // координата по X и по Y
    
    BOOL gameoverBOOL; //если нажат GAMEOVER
    
    float timerIndicator,timeBetweenFruits; //таймер с 0 и до timeBetweenFruits
    float timerDisplay; // переменная для timerLabel 00:00:00
    //float difficultyIndex;
    
    //BOOL touchBOOL;
    
    ///// SOUNDS and MUSIC //////////
    NSString *hitSound;
    NSString *grenadeSound;
    NSString *boxSound;
    NSString *mechSound;
    NSString *boomerangSound;
    NSString *youLoseSound;
    NSString *youWinSound;
    
    /////////////////////////////////
    
    ///// POWERUPS/SLOTS ////////////
    CCSprite *grenadePowerUp;
    CCSprite *boxPowerUp;
    CCSprite *mechPowerUp;
    CCSprite *boomerangPowerUp;
    /////////////////////////////////
    
    CCSprite *bgBlack; // полноэкранное ЗАТЕМНЕНИЕ
    
    
    //// GRENADE VARIABLES ////////
    //BOOL grenadeBOOL;
    float timerBomb;
    
    CCSprite *grenade; // отображение КОГДА суперудар АКТИВЕН
    CCSprite *bombSprite; // КВАДРАТ столкновения ГРАНАТЫ с фруктами
    CGPoint explosionPosition;
    
    //// BOX VARIABLES ////////////
    BoxPowerUp *box;
    //BOOL boxBOOL;
    BOOL kickBOOL; // БУЛЕВА если YES Бьет ЛЕВОЙ потом ПРАВОЙ
    
    BOOL kickEnableBOOL; // БУЛЕВА если YES можно БИТЬ
    float kickTimerFloat;
    
    CCSprite *gloveRight;
    CCSprite *gloveLeft;
    CCLabelTTF *boxLabel; // CEКУНДОМЕР БОКСА
    int indexBomb;
    
    float timerBox;
    
    CGPoint boxPosition; // ТОЧКА удара БОКСЕРСКОЙ ПЕРЧАТКОЙ (ЛЕВОЙ/ПРАВОЙ)
    
    //// MECH VARIABLES ////////
    //BOOL mechBOOL;  //на нажатие кнопки(YES) и нажатие в игровом поле (NO)
    
    CCSprite *mechLeft;
    CCSprite *mechRight;
    CCSprite *moveSprite;
    
    CCLabelTTF *mechLabel; // CEКУНДОМЕР МЕЧА
    float timerMech;
    
    //// BUMERANG VARIABLES ////////
    //BOOL boomerangBOOL;
    CCSprite *boomerang;
    CGPoint boomerangPosition;
    float timerBoomerang;
    
    CCLabelTTF *boomerangLabel; // CEКУНДОМЕР БУМЕРАНГА
    int indexBoomerang;
    
    /// GO! TIMER ////////////
    float timerGo;
    CCSprite *goOneSprite;
    CCSprite *goTwoSprite;
    CCSprite *goThreeSprite;
    CCSprite *goStartSprite;
    
    BOOL oneInBOOL, oneOutBOOL, twoInBOOL, twoOutBOOL,threeInBOOL, threeOutBOOL, goInBOOL, goOutBOOL;
    BOOL goDoneBOOL;
    
    /// BONUS ELEMENTS
    CCArray *bonusArray;
    NSArray *bonusTypes;
    
    int fruitsInt;
    
    int bombBonusInt; //Сколько упало BOMB Бонусов
    int boxBonusInt;
    int mechBonusInt;
    int boomerangBonusInt;
    
    int bombBonusTake; //Сколько взято BOMB Бонусов
    int boxBonusTake;
    int mechBonusTake;
    int boomerangBonusTake;
    
    CCLabelTTF *bombBonusLabel;
    CCLabelTTF *boxBonusLabel;
    CCLabelTTF *mechBonusLabel;
    CCLabelTTF *boomerangBonusLabel;
    
    /// MONETA
    int monetaCountInt; //Сколько вывалилось монет
    int monetaTakeInt;  //Сколько собрано монет
    CCLabelTTF *monetaCountLabel;
    CCSprite *monetaIndicator;
    
    /// BUDILNIK
    CCLabelTTF *budilnikTimerLabel;
    CCSprite *budilnikIndicator;
    float budilnikFloat;
    float timerBudilnik;
    
    
    ////////// LEVEL+TIMER+POPUP+STATISTICS ////////
    
    /// LEVEL TIMER
    int levelTimerFloat; //MILISEC
    int levelSecondInt; //SEC
    int levelMinuteInt; //MIN
    
    CCLabelTTF *levelTimerLabel; // ТАЙМЕР уровня ФОРМАТ 00:00 (2мин)
    CCLabelTTF *levelLabel; //НАДПИСЬ УРОВЕНЬ
    CCLabelTTF *levelNumberLabel; // НОМЕР УРОВНЯ
    
    int LEVELNUMBER;
    
    /// LEVEL COMPLETE MENU
    CCMenuItemSprite *nextButton;
    CCMenuItemSprite *mainmenuButton;
    CCMenuItemSprite *ratingButton;
    CCMenu *menuNext;
    
    //PAUSE BUTTON
    //CCMenuItemSprite *pauseButton;
    //CCMenuItemSprite *statsButton;
    
    BOOL isPaused;  // ЕСЛИ на ПАУЗЕ -> тач ОТКЛЮЧАЕТСЯ
    BOOL isGameOver;
    BOOL isGameStat;
    BOOL isStats;
    
    ///////////// SCORE SYSTEM ///////////////
    //// GRENADE SCORE
    CCSprite *grenadeIndicator;
    CCLabelTTF *grenadeScoreLabel;
    int grenadeScoreInt;
    
    //// BOX SCORE
    CCSprite *boxIndicator;
    CCLabelTTF *boxScoreLabel;
    int boxScoreInt;
    
    //// MECH SCORE
    CCSprite *mechIndicator;
    CCLabelTTF *mechScoreLabel;
    int mechScoreInt;
    
    //// BOOMERANG SCORE
    CCSprite *boomerangIndicator;
    CCLabelTTF *boomerangScoreLabel;
    int boomerangScoreInt;
    
    //// KULAK SCORE
    CCSprite *kulakIndicator;
    CCLabelTTF *kulakScoreLabel;
    int kulakScoreInt;
    /////////////////////////////////////////
    
    ///// МЕТКА суперудара ///////
    BOOL kulakBOOL;
    BOOL grenadeBOOL;
    BOOL boxBOOL;
    BOOL mechBOOL;
    BOOL boomerangBOOL;
    
    CCSprite *boundaryBox; //  ЭКРАН активного ГЕЙМПЛЕЯ
    
    ///// GAMEOVER /////
    BOOL gameOverBOOL;  //нажата gameOverLabel
    CCLabelTTF *gameOverLabel;
    
    ////
    BOOL collisionBOOL;
    
    // номер выбранного игрового объекта
    int i;
    int NUM;
    
    
    // номер ШАГА в ТУТОРИАЛЕ
    int STEP;
    BOOL STEP1BOOL;
    BOOL STEP2BOOL;
    BOOL STEP3BOOL;
    BOOL STEP4BOOL;
    BOOL STEP5BOOL;
    BOOL STEP6BOOL;
    BOOL STEP7BOOL;
    BOOL STEP8BOOL;
    BOOL STEP9BOOL;
    BOOL STEP10BOOL;
    BOOL STEP11BOOL;
    BOOL STEP12BOOL;
    BOOL STEP13BOOL;
    
    int count;
    
    BOOL TUTORBOOL;
    
    BOOL level1BOOL;
    BOOL level2BOOL;
    BOOL level3BOOL;
    BOOL level4BOOL;
    BOOL level5BOOL;
    BOOL level6BOOL;
    BOOL level7BOOL;
    BOOL level8BOOL;
    BOOL level9BOOL;
    BOOL level10BOOL;
    
    int randomNumber;
    
    BOOL planBOOL; //Завершающая 3-я атака
    
    BOOL planA; //60-50сек
    BOOL planB; //50-40сек
    BOOL planC; //40-30сек
    BOOL planD; //30-20сек
    BOOL planE; //20-10сек
    BOOL planF; //10-0сек
    
    BOOL planDelay;
    
    
    //PAUSE BUTTON
    //CCMenuItemSprite *pauseButton;
    CCMenuItemSprite *statsButton;
    
    
    /// ИТОГОВЫЙ SCORE
    int TOTALSCORE;
    
    int FRUITNUM;
    
    float vesaFloat;
    
    
    //SPRITE SHEETS
    CCSpriteBatchNode *spriteSheet;
    
    CCSprite *segmentYellow;
    
    float timerDelay;
    BOOL delayA;
    
    int balanceInt;
    
    CCLabelTTF *speedTestLabel;
    CCLabelTTF *procentileLabel;
    
    float procent;
    float procentileFloat;
    
    CCSprite *dangerSprite;
    
    CCAction *repAlert;
    BOOL alertBOOL;
    BOOL alertStopBOOL;
    
    BOOL isSoundOn;
    BOOL isMusicOn;
    
    float soundFloat;
    BOOL soundEnableBOOL;
    
    float alertTimer;
}

+(CCScene *)scene;


//INITIALISE
-(void)startGo;
-(void)setSecundomers;
-(void)setGameplayIndicators;
-(void)setBonusIndicators;
-(void)setPauseButton;
-(void)setPowerUps;
-(void)setAdsBanner;
-(void)blackForeground;
-(void)boundaryBox;
-(void)setMoveSprite;
-(void)initializeSoundData;

//OTHERS
-(void)statsGame;
-(void)startBudilnikActions;
-(void)removeTimerBomb;
-(void)removeChoosePowerUp;
-(void)setStep10Bool;

-(void)enableTouch;
-(void)setUserDefaults;
-(void)getUserDefaults;


//GRENADE
-(void)startGrenade;
-(void)hidePowerUps;
-(void)powerUpsMoveDown;
-(void)closeGrenade;
-(void)showPowerUps;
-(void)powerUpsMoveBack;
-(void)grenadeExplosion;

//BOX
-(void)startBox;
-(void)closeBox;

//MECH
-(void)startMech;
-(void)closeMech;

//BOOMERANG
-(void)startBoomerang;
-(void)closeBoomerang;
-(void)boomerangKick;


-(void)didScore;
-(void)disableTouch;

#pragma mark < TUTORIAL >
-(void)setTutorLevel;
-(void)startTutorLevel;
-(void)chooseTutorFruit;
-(void)addFruitCentering;
-(void)checkStepTimer:(ccTime)dt;


@end
