//
//  AVSpeechController.m
//  AVFoundationDemo
//
//  Created by aixuexi on 2021/12/8.
//

#import "AVSpeechController.h"
#import <AVFoundation/AVFoundation.h>

@interface AVSpeechController ()<AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, strong) NSArray *voices;
@property (nonatomic, strong) NSArray *speechStrings;

@property (nonatomic, strong) UILabel *speechLabel;
@property (nonatomic, strong) UIButton *speechButton;

@end

@implementation AVSpeechController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"AVFoundation 初体验";
    _synthesizer = [[AVSpeechSynthesizer alloc] init];
    _synthesizer.delegate = self;
    _voices = @[
        [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],
        [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"],
    ];
    
    _speechStrings = [self buildSpeechStrings];
    
    
   
    
    _speechButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_speechButton setTitle:@"speech" forState:UIControlStateNormal];
    [_speechButton setTitle:@"stop" forState:UIControlStateSelected];
    [_speechButton addTarget:self action:@selector(speechAction:) forControlEvents:UIControlEventTouchUpInside];
    _speechButton.backgroundColor = [UIColor cyanColor];
    _speechButton.layer.cornerRadius = 16;
    _speechButton.layer.masksToBounds = YES;
    [self.view addSubview:_speechButton];
    [_speechButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.height.mas_equalTo(33);
        make.centerY.mas_equalTo(-30);
        
    }];
    
    _speechLabel = [[UILabel alloc] init];
    _speechLabel.numberOfLines = 0;
    _speechLabel.font = [UIFont boldSystemFontOfSize:18.0];
    _speechLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_speechLabel];
    [_speechLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-16);
        make.top.equalTo(self.speechButton.mas_bottom).offset(30);
    }];
}

-(void)speechAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if(sender.selected)
    {
        [self beginConversation];
    }else
    {
        [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}


-(NSArray *)buildSpeechStrings {
    
    return  @[
        @"Hello AV Foundation. How are you?",
        @"I'm well! Thanks for asking .",
        @"Are you excited about the book?",
        @"Very! I have always felt so misunderstood",
        @"What's your favorite feature?",
        @"Oh, they're all my babies. I couldn't possibly choose.",
        @"It was great to speak with you!",
        @"The pleasure was all mine! Have fun!",
        @"The last"
    ];
    
}



-(void)beginConversation {
    for (NSUInteger i = 0; i < self.speechStrings.count; i++){
        AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.speechStrings[i]];
        utterance.voice = self.voices[i % 2];
        utterance.rate = 0.4f;
        utterance.pitchMultiplier = 0.8f;
        utterance.postUtteranceDelay = 0.1f;
        [self.synthesizer speakUtterance:utterance];
    }
    
}



- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance
{
    self.speechLabel.text = utterance.speechString;
    self.speechButton.selected = YES;
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    self.speechLabel.text = @"";
    if([utterance.speechString isEqualToString:@"The last"])
    {
        self.speechButton.selected = NO;
    }
}

@end
