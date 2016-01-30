//
//  SEKonashi.m
//  SExtreamHomeHack
//
//  Created by 文光石 on 2015/12/26.
//  Copyright © 2015年 Threees. All rights reserved.
//

#import "DSKonashi.h"
#import "Konashi.h"

@interface DSKonashi()

@property (nonatomic, strong) NSTimer* blinkTimer;
@property (nonatomic) double currentInterval;
@property (nonatomic) BOOL blinking;

@end

@implementation DSKonashi

- (id)init
{
    if (self = [super init]) {
        _currentInterval = 0;
        _blinking = NO;
        // Register event handler
        [[Konashi shared] setReadyHandler:^{
            NSLog(@"Ready");
            // Set pin mode to output
            [Konashi pinMode:KonashiLED2 mode:KonashiPinModeOutput];
            
            // Make LED2 glow
            [Konashi digitalWrite:KonashiLED2 value:KonashiLevelHigh];
            
            // blink timer
            //self.blinkTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(blink) userInfo:nil repeats:YES];
            
            _blinking = YES;
            [self blink];
        }];
        
        [[Konashi shared] setDisconnectedHandler:^{
            // stop blinking
            //[self.blinkTimer invalidate];
            _blinking = NO;
        }];
    }
    
    return self;
}

- (void)blink
{
    while (_blinking) {
        if (_currentInterval <= 0) {
            [Konashi digitalWrite:KonashiLED2 value:KonashiLevelLow];
        } else {
            static BOOL glow = NO;
            glow = !glow;
            [Konashi digitalWrite:KonashiLED2 value:(glow ? KonashiLevelHigh : KonashiLevelLow)];
        }
        //sleep(_currentInterval);
        [NSThread sleepForTimeInterval:_currentInterval];
        
    }
}

- (void)find
{
    //test
    _currentInterval = 1;
    
    
    [Konashi find];
}

- (void)findWithName:(NSString*)name
{
    //test
    _currentInterval = 1;
    
    [Konashi findWithName:name];
}

- (void)setLevel:(int)level
{
    double interval = 0;
    
    if (level == 0) {
        interval = 0;
    } else if (level == 1) {
        interval = 1.0;
    } else if (level == 2) {
        interval = 0.5;
    } else if (level == 3) {
        interval = 0.25;
    }
    
    // blink timer
    if (interval != _currentInterval) {
        if (interval > 0) {
            NSLog(@"restart:%f", interval);
            //[self.blinkTimer invalidate];
            //self.blinkTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(blink) userInfo:nil repeats:YES];
            //[Konashi digitalWrite:KonashiLED2 value:KonashiLevelLow];
            //_currentInterval = interval;
        } else {
            // stop blinking
            //[self.blinkTimer invalidate];
        }
        
        _currentInterval = interval;
    }
}

@end
