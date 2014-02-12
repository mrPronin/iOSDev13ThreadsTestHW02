//
//  RITStudent.m
//  13ThreadsTestHW01
//
//  Created by Aleksandr Pronin on 11.02.14.
//  Copyright (c) 2014 Aleksandr Pronin. All rights reserved.
//

#import "RITStudent.h"

@implementation RITStudent

- (void) guessTheAnswer:(NSInteger) rightAnswer
      withRangeFromLeft:(NSInteger) left
                toRight:(NSInteger) right
         andResultBlock: (void(^)(NSString*, NSInteger, CGFloat)) block {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSInteger answer = 0;
        
        double startTime = CACurrentMediaTime();
        
        while (!(answer==rightAnswer)) {
            answer = (arc4random() % (right - left) + left);
        }
        
        block(self.name, answer, CACurrentMediaTime() - startTime);
        
    });
    
}

@end
