//
//  AppDelegate.m
//  ios-prework-objc-assessment
//
//  Created by Joel Bell on 5/23/16.
//  Copyright © 2016 Joel Bell. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  
  NSArray *numbersArray = [[NSArray alloc] init];
  NSArray *lettersArray = [[NSArray alloc] init];
  NSDictionary *alphabetDictionary = [[NSDictionary alloc] init];
  
  numbersArray = [self generateArrayOfNumbers];
  lettersArray = [self generateArrayOfLetters];
  alphabetDictionary = [self generateNumbersAndLettersDictionaryWithNumbers:numbersArray letters:lettersArray];
  
  NSLog(@"Alphabet Dictionary: %@", alphabetDictionary);
  
  numbersArray = alphabetDictionary.allKeys;
  
  NSMutableArray *mutableLettersArray = [lettersArray mutableCopy];
  [mutableLettersArray removeAllObjects];
  
  for (NSString *key in alphabetDictionary) {
    NSString *value = [alphabetDictionary objectForKey:key];
    [mutableLettersArray addObject:value];
  }
  
  NSLog(@"Numbers Array: %@\nMutable Letters Array: %@", numbersArray, mutableLettersArray);
  
  return YES;
}

/**
 This method should return an array which contains 26 elements, the whole numbers 1 through 26.
 Do not hard-code these values into the array.
 */
- (NSArray *)generateArrayOfNumbers
{
  NSMutableArray *numbersArray = [[NSMutableArray alloc] initWithCapacity:26];
  
  for (NSInteger index = 1; index <= 26; index++) {
    [numbersArray addObject:@(index)];
  }
  
  return numbersArray;
}

/**
 This method should return an array which contains the 26 letters of the English alphabet, lowercase and in ascending order.
 
 An individual letter can be of type char, which can be altered by adding an integer.
 For example, 'a' + 2 will result in 'c'.
 */
- (NSArray *)generateArrayOfLetters
{
  NSMutableArray *lettersArray = [[NSMutableArray alloc] initWithCapacity:26];
  
  for (char index = 'a'; index <= 'z'; index++) {
    
    [lettersArray addObject:[NSString stringWithFormat:@"%c", index]];
  }
  
  return lettersArray;
}


/**
 This method should return a dictionary that contains key-value pairs of numbers as keys 
 and their corresponding letters as values by using the two provided arguments.
 
 key : value
 number : letter
 
 */
- (NSDictionary *)generateNumbersAndLettersDictionaryWithNumbers:(NSArray *)numbersArray letters:(NSArray *)lettersArray
{
  NSMutableDictionary *alphanumericDictionary = [[NSMutableDictionary alloc] initWithCapacity:26];
  
  for (NSInteger index = 0; index < 26; index++) {
    [alphanumericDictionary setObject:lettersArray[index] forKey:[NSString stringWithFormat:@"%@", numbersArray[index]]];
  }
  
  return alphanumericDictionary;
}

@end

























