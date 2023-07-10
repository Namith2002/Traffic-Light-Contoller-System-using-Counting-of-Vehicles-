% Traffic Light Controller System using Vehicle Counting

% Set the parameters
greenTime = 10; % Time in seconds for the green light
redTime = 5; % Time in seconds for the red light
threshold = 50; % Minimum number of vehicles to trigger a change

% Load the video or image sequence
video = VideoReader('traffic.mp4'); % Replace 'traffic.mp4' with the path to your video file
frameRate = video.FrameRate;

% Initialize variables
frameCount = 0;
vehicleCount = 0;
currentState = 'green'; % Initial state

while hasFrame(video)
    % Read the current frame
    frame = readFrame(video);
    
    % Perform vehicle detection/counting
    % Implement your own vehicle detection algorithm here
    % You can use any pre-trained object detection model, background subtraction, or other techniques
    
    % Increment the frame count
    frameCount = frameCount + 1;
    
    % Update the vehicle count
    % Replace this with your own vehicle counting logic based on the detection results
    % For simplicity, let's assume the vehicle count is fixed at 10 for the entire video
    vehicleCount = 10;
    
    % Check if the vehicle count exceeds the threshold
    if vehicleCount > threshold
        % Change the traffic light state
        if strcmp(currentState, 'green')
            currentState = 'red';
            disp('Changing to red...');
            pause(redTime);
        else
            currentState = 'green';
            disp('Changing to green...');
            pause(greenTime);
        end
    end
    
    % Display the current frame and traffic light state
    imshow(frame);
    title(['Current State: ' currentState]);
    drawnow;
    
    % Adjust the delay based on the frame rate to maintain real-time behavior
    pause(1 / frameRate);
end
