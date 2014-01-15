//
//  GSCheckBoxButton.h
//
//  Created by Gil Serra on 15/01/14.
//

#import <UIKit/UIKit.h>

@class GSCheckBoxButton;

typedef void(^TextPressedBlock)();
typedef void(^CheckBoxPressedBlock)(BOOL isChecked);

@interface GSCheckBoxButton : UIView

@property (nonatomic, assign, readonly, getter = isChecked) BOOL checked;
@property (nonatomic, strong, readwrite) TextPressedBlock onTextPressed;
@property (nonatomic, strong, readwrite) CheckBoxPressedBlock onCheckBoxPressed;

- (void)onTextPressed:(TextPressedBlock)onTextPressedBlock
    onCheckBoxPressed:(CheckBoxPressedBlock)onCheckBoxPressedBlock;

- (void)setTitle:(NSString *)aTitle forControlState:(UIControlState)aControlState;
- (void)setAttributedTitle:(NSAttributedString *)anAttributtedString forState:(UIControlState)aControlState;

@end
