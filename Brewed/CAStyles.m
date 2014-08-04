//
//  CAStyles.m
//  Brewed
//
//  Created by Brian Corbin on 8/4/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

#import "CAStyles.h"

@implementation CAStyles

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.style forKey:@"style"];
    [encoder encodeObject:self.OG forKey:@"OG"];
    [encoder encodeObject:self.FG forKey:@"FG"];
    [encoder encodeObject:self.IBU forKey:@"IBU"];
    [encoder encodeObject:self.L forKey:@"L"];
    [encoder encodeObject:self.ABV forKey:@"ABV"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.style = [decoder decodeObjectForKey:@"style"];
        self.OG = [decoder decodeObjectForKey:@"OG"];
        self.FG = [decoder decodeObjectForKey:@"FG"];
        self.IBU = [decoder decodeObjectForKey:@"IBU"];
        self.L = [decoder decodeObjectForKey:@"L"];
        self.ABV = [decoder decodeObjectForKey:@"ABV"];
    }
    return self;
}

@end
