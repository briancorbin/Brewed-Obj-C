//
//  CAStyles.h
//  Brewed
//
//  Created by Brian Corbin on 8/4/14.
//  Copyright (c) 2014 Caramel Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAStyles : NSObject

@property (strong, nonatomic) NSString* style;
@property (strong, nonatomic) NSNumber* OG;
@property (strong, nonatomic) NSNumber* FG;
@property (strong, nonatomic) NSNumber* IBU;
@property (strong, nonatomic) NSNumber* L;
@property (strong, nonatomic) NSNumber* ABV;

- (void)encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;

@end
