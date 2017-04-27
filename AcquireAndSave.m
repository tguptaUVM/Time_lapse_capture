function AcquireAndsave (Mainctr, framectr)
vid = videoinput('macvideo', 1, 'YUY2_1600x1200');
vid.ReturnedColorspace = 'rgb';
 
img = getsnapshot(vid);
frameTimename = datestr(now,'HH_MM_SS_AM a');
fname = ['Image' num2str(Mainctr), '-' num2str(frameTimename),...
    '_Frame' num2str(framectr)]; 
imwrite(img, fname, 'tiff');
disp(['Just saved image ' fname]);
datetime('now','TimeZone','local','Format','eeee, MMMM d, yyyy hh:mm:ss:ms a')
end
