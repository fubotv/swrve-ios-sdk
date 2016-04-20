#import "SwrveTriggerCondition.h"

@implementation SwrveTriggerCondition

@synthesize key = _key;
@synthesize value = _value;
@synthesize triggerOperator = _triggerOperator;
@synthesize conditionOperator = _conditionOperator;

- (id) initWithDictionary:(NSDictionary *)dictionary andOperator:(NSString *) operatorKey {
    self = [super init];
    if(self) {
        
        _key = [dictionary objectForKey:@"key"];
        _value = [dictionary objectForKey:@"value"];
        _triggerOperator = [self determineSwrveOperator:operatorKey];
        _conditionOperator = [self determineSwrveOperator:[dictionary objectForKey:@"op"]];
        
    }
    
    return self;
}

- (SwrveTriggerOperator) determineSwrveOperator:(NSString *)op {

    if([op isEqualToString:@"and"]){
        return SwrveTriggerOperatorAND;
    }else if([op isEqualToString:@"eq"]){
        return SwrveTriggerOperatorEQUALS;
    }else{
        return SwrveTriggerOperatorOTHER;
    }
}

- (BOOL) hasFulfilledCondition:(NSDictionary *)payload {
    
    if(!payload){
        return NO;
    }
    
    NSArray *payloadKeys = [payload allKeys];
    
    if([payloadKeys containsObject:_key]){
        NSString *payloadValue = [payload objectForKey:_key];
        return ([payloadValue isEqualToString:_value]);
        
    }else{
        return NO;
    }
}


@end