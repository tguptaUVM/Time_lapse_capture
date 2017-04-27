% Tarun Gupta, UVM; 2016 March 29
% Acquire images at regular intervals.
% (this script requires AcquireAndsave function script)
 
global vid
imaqhwinfo;
info=imaqhwinfo('macvideo'); 
vid = videoinput('macvideo', 1, 'YUY2_1600x1200');
vid.ReturnedColorspace = 'rgb';
triggerconfig(vid, 'immediate');
 
ImageTimer = timer;
set(ImageTimer,'TimerFcn', 'AcquireAndsave(Mainctr, framectr)',...
    'Startdelay', 10,'ExecutionMode', 'singleshot');
 
start(vid);
 
for Mainctr = 1:25   % 24 for 24 hr acqusition.
    MainTime = clock;
    preview(vid);
      
    for framectr = 1:3   % will capture 3 frames, each one minute apart. 
        frameTime = clock;     
        start(ImageTimer);
        elapsed = etime(clock, frameTime);
        pause(60 - elapsed); % 1 frame every minute, value = 60
    end
    
    stoppreview(vid);
    closepreview(vid);
    stop(vid);
    Mainelapsed = etime(clock, MainTime);
    pause(3600 - Mainelapsed); % 1 hour main counter, value = 3600
   
end
stop(vid);
clear all;
