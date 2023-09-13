**HEY!**

Employee Directory App for Square - **TEAMR**

## Build tools & versions used
- Xcode V 13.4.1
- SWIFT 5
- BUILD on any iPhone device only please - iOS v15.5 (not optimzed for iPad)
- BUILD on any branch
- BUILD on DEBUG or RELEASE mode.

## Steps to run the app
- Open Terminal (Mac).
- Enter Main Folder/Directory of the App (Teamr).
- Type the following command: pod install.
- Go to Main Folder/Directory of the App (Teamr).
- Open the .xcworkspace file.
- Change build target to TeamrKit.
- Run/Built it.
- Change build Target to Teamr and now you can run/build it as you'd like.

## What areas of the app did you focus on?
Many... There is a separate module for the business logic and repository, all protocoled and sealed in different ways, displaying a focus on separating the api logic from the rest of the app.
Also implemented a shared Pods resource for both modules to have access to the pods.
Lastly, otherwise is very simple UI logic in VIPER architecture to showcase a clean narative of logic separation and cleanliness.

## What was the reason for your focus? What problems were you trying to solve?
Not really any problems to solve, more like building a general purpose App that has longevity. I tried to implement as much reusable UI that has longevity to it. Also longevity is the most important part of the app besides encapsulation, allowing what we change on TeamrKit to be separate from the UI portion. Making this an easy way to allow other team members to edit this code and to really rely on the fact that it will work and not break years down the line.

## How long did you spend on this project?
3-4 hours.

## Did you make any trade-offs for this project? What would you have done differently with more time?
I brought in my helpers that are custom that i made from my personal app. With this, it allowed me to demonstate my capabilities of implementing a VIPER format and showcasing the different ways of logic and responsibility separation for SWIFT and Xcode. With more time, I would have done SwiftUI but I am not the best at that, so i went with what i am more comfortable with.

## What do you think is the weakest part of your project?
Complex architecture for such a small app with little responsibility. Making it kind of "overkill"... The take home project outlines to show what I am capable of though, so I thought it would be cool to do VIPER since I havent in so long as well. With this though, complexity of course, can add a learning curve to someone reading it, adding more time.

## Did you copy any code or dependencies? Please make sure to attribute them here!
None copied from any EXTERNAL RESOURCES or THIRD PARTIES... All code is written by me either in this project or in the past from my personal projects (nothing licenced or published). Pods are the exception though, the Pods I used are the following:

- Alamofire (API Session helper)
- TinyConstrinats (Constraints management for XIB/Storyboards Helper)
- KingFisher (Image caching and retreiving framework)

## Is there any other information you’d like us to know?
I made this with my version of a **VIPER** architecture format.
The TeamrKit is more API logic and data driven stuff. 
There are plenty of extensions that I have ported over to help me with mostly minor tasks.
Not optimzed for iPad.
Run on DEBUG mode is probably safest, still hitting the end points I was given anyways.

List of some cool patterns, items and architecture used:
- VIPER
- Dependency injection via singleton (Swifty version)
- Cool subscripts and extensions to make life easier
- Localizables
- Decoding patterns
- Decoding errors from headers
- Error handling and some typical error cases that can arise
- Request construction
- API Routing and pathing
- UI Routing in main app (not really needed...)
- Separate Module for api logic and data
- Unit (small but enough) spy method tests
- And more!
