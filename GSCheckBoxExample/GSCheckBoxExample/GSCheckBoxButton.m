//
//  GSCheckBoxButton.m
//
//  Created by Gil Serra on 15/01/14.
//

#import "GSCheckBoxButton.h"

static NSString *const kCheckedImageName = @"checkBox_checked";
static NSString *const kUncheckedImageName = @"checkBox_unchecked";
static NSString *const kDefaultText = @"Accept terms and conditions";
static const CGFloat kButtonSpacing = 5.0;

@interface GSCheckBoxButton()

@property (nonatomic, assign, readwrite) BOOL checked;
@property (nonatomic, strong) UIButton *checkBox;
@property (nonatomic, strong) UIButton *textButton;
@property (nonatomic, strong) UIImage *checkedImage;
@property (nonatomic, strong) UIImage *uncheckedImage;

@end

@implementation GSCheckBoxButton


- (instancetype)initWithFrame:(CGRect)frame
                onTextPressed:(TextPressedBlock)onTextPressedBlock
            onCheckBoxPressed:(CheckBoxPressedBlock)onCheckBoxPressedBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        _onCheckBoxPressed = onCheckBoxPressedBlock;
        _onTextPressed = onTextPressedBlock;
        [self awakeFromNib];
    }
    return self;
}

+ (instancetype)buttonWithFrame:(CGRect)buttonFrame
                  onTextPressed:(TextPressedBlock)onTextPressedBlock
              onCheckBoxPressed:(CheckBoxPressedBlock)onCheckBoxPressedBlock
{
    return [[self alloc]initWithFrame:buttonFrame
                        onTextPressed:onTextPressedBlock
                    onCheckBoxPressed:onCheckBoxPressedBlock];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.checkedImage = [UIImage imageNamed:kCheckedImageName];
    self.uncheckedImage = [UIImage imageNamed: kUncheckedImageName];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (!self.checkBox) {
        [self setupCheckBoxButton];
    }
    [self addSubview:self.checkBox];
    if (!self.textButton) {
        [self setupTextButton];
    }
    [self addSubview:self.textButton];
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - Setup methods

- (void)setupCheckBoxButton
{
    //Default checkBox setup
    _checkBox = [UIButton buttonWithType:UIButtonTypeCustom];
    _checkBox.frame = CGRectMake(0,
                                 0,
                                 CGRectGetHeight(self.bounds),
                                 CGRectGetHeight(self.bounds));
    [_checkBox setBackgroundImage:self.uncheckedImage
                         forState:UIControlStateNormal];
    [_checkBox addTarget:self
                  action:@selector(checkBoxPressed:)
        forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupTextButton
{
    //Default text button setup
    _textButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat buttonX = CGRectGetHeight(self.bounds) +  kButtonSpacing;
    _textButton.frame = CGRectMake(buttonX,
                                   0,
                                   CGRectGetWidth(self.bounds) - buttonX,
                                   CGRectGetHeight(self.bounds));
    [_textButton setTitle:kDefaultText
                 forState:UIControlStateNormal];
    [_textButton addTarget:self
                    action:@selector(textPressed:)
          forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Button actions

- (void)checkBoxPressed:(id)sender
{
    if (self.checked) {
        [self.checkBox setBackgroundImage:self.uncheckedImage
                                 forState:UIControlStateNormal];
    } else {
        [self.checkBox setBackgroundImage:self.checkedImage
                                 forState:UIControlStateNormal];
    }
    self.checked = !self.checked;
    if (self.onCheckBoxPressed) {
        self.onCheckBoxPressed(self.checked);
    }
}

- (void)textPressed:(id)sender
{
    if (self.onTextPressed) {
        self.onTextPressed();
    }
}

- (void)onTextPressed:(TextPressedBlock)onTextPressedBlock
    onCheckBoxPressed:(CheckBoxPressedBlock)onCheckBoxPressedBlock
{
    self.onTextPressed = onTextPressedBlock;
    self.onCheckBoxPressed = onCheckBoxPressedBlock;
}

#pragma mark - Text button properties

- (void)setTitle:(NSString *)aTitle forControlState:(UIControlState)aControlState
{
    [self.textButton setTitle:aTitle forState:aControlState];
}

- (void)setAttributedTitle:(NSAttributedString *)anAttributtedString
                  forState:(UIControlState)aControlState
{
    [self.textButton setAttributedTitle:anAttributtedString forState:aControlState];
}

#pragma mark - Button getters

- (UIButton *)textButton
{
    if (!_textButton) {
        [self setupTextButton];
    }
    return _textButton;
}

- (UIButton *)checkBox
{
    if (!_checkBox) {
        [self setupCheckBoxButton];
    }
    return _checkBox;
}

@end
