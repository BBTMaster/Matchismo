//
//  PlayingCard.m
//  Matchismo
//
//  Created by Wilson on 2014-02-26.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards{
    int score = 0;
    
    if ([otherCards count] == 1){
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank){
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    } else if ([otherCards count] == 2){
        PlayingCard *firstOhterCard = [otherCards firstObject];
        PlayingCard *secondOhterCard = [otherCards objectAtIndex:1];
        if (self.rank == firstOhterCard.rank == secondOhterCard.rank || ([self.suit isEqualToString:firstOhterCard.suit] && [self.suit isEqualToString:secondOhterCard.suit]))
        {
                score = 8;
        } else if (self.rank == firstOhterCard.rank || self.rank == secondOhterCard.rank || firstOhterCard.rank == secondOhterCard.rank  || ([self.suit isEqualToString:firstOhterCard.suit]) || ([self.suit isEqualToString:secondOhterCard.suit]) || ([firstOhterCard.suit isEqualToString:secondOhterCard.suit])){
            score = 4;
        }
    }
    
    
    return score;
}


- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}
@synthesize suit = _suit;

+ (NSArray *)validSuits{
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {
    return [[self rankStrings] count] - 1;
}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}
@end