//
//  Vehicle+CoreDataProperties.m
//  
//
//  Created by PAUL CHRISTIAN on 12/15/17.
//
//  This file was automatically generated and should not be edited.
//

#import "Vehicle+CoreDataProperties.h"

@implementation Vehicle (CoreDataProperties)

+ (NSFetchRequest<Vehicle *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Vehicle"];
}

@dynamic make;
@dynamic model;
@dynamic mpg;
@dynamic year;

@end
