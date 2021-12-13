//
//  AVSpeechController.m
//  AVFoundationDemo
//
//  Created by aixuexi on 2021/12/8.
//

#import "AVSpeechController.h"
#import <AVFoundation/AVFoundation.h>

@interface AVSpeechController ()

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
    _voices = @[
        [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"],
        [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"],
    ];
    
    _speechStrings = [self buildSpeechStrings];
    
    
    _speechButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_speechButton setTitle:@"speech" forState:UIControlStateNormal];
    
    
    
    _speechLabel = [[UILabel alloc] init];
    _speechLabel.numberOfLines = 0;
    _speechLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [self.view addSubview:_speechLabel];
    
    
    
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
        @"The pleasure was all mine! Have fun!"
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


@end
