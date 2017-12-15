//
//  Vehicle+CoreDataProperties.h
//  
//
//  Created by PAUL CHRISTIAN on 12/15/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Vehicle+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Vehicle (CoreDataProperties)

+ (NSFetchRequest<Vehicle *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *make;
@property (nullable, nonatomic, copy) NSString *model;
@property (nonatomic) double mpg;
@property (nonatomic) int16_t year;

@end

NS_ASSUME_NONNULL_END
