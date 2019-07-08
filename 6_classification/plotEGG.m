function [ eegPlot ] = plotEGG( canais )
%PLOTEGG Summary of this function goes here
%   Detailed explanation goes here
  
  eegPlot = figure('visible','off');

  xlim([-18 18])
  ylim([-18 18])

  % Set the axis aspect ratio to 1:1.
  axis square
  %axis equal

  % Desenha nariz
  line([-1,0], [14.8, 17], 'Color', 'k');
  hold on
  line([1,0], [14.8, 17], 'Color', 'k');
  
  % Desenha cabeca
  rectangle('Position',[-15 -15 30 30],'Curvature',[1 1],'FaceColor','w')
  line([0,0], [-15,15], 'Color', 'k');
  line([-15,15], [0,0], 'Color', 'k');
  

  ch = localizacao();
  radii = 1;
  
  for i=1:length(ch)
    pos = [ch(i).x, ch(i).y, ch(i).w*2, ch(i).h*2];
    circulo = rectangle('Position',pos,'Curvature',[1 1],'FaceColor','w');
    text('Position',[ch(i).x+0.4, ch(i).y+1.4],'string',ch(i).Nome)
    text('Position',[ch(i).x+0.5, ch(i).y+0.7],'string',ch(i).Nro)
    if any(canais==i)
      circulo.FaceColor = 'y';
    end;
    %r = viscircles(pos,radii,'LineWidth',1);
  %r.EdgeColor = 'b'
  end
  
end

function channels = localizacao()
  Nro = { 1,  2,  3,  4,  5,  6,  7,  8,  9, 10, ... 
         11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...
         21, 22, 23, 24, 25, 26, 27, 28, 29, 30, ...
         31, 32, 33, 34, 35, 36, 37, 38, 39, 40, ...
         41, 42, 43, 44, 45, 46, 47, 48, 49, 50, ...
         51, 52, 53, 54, 55, 56, 57, 58, 59, 60, ...
         61, 62, 63, 64};
       
  Nome = {'FC5', 'FC3', 'FC1', 'FCz', 'FC2', 'FC4', 'FC6', 'C5', 'C3', 'C1', ...
          'Cz', 'C2', 'C4', 'C6', 'CP5', 'CP3', 'CP1', 'CPz', 'CP2', 'CP4', ...
          'CP6', 'Fp1', 'Fpz', 'Fp2', 'AF7', 'AF3', 'AFz', 'AF4', 'AF8', 'F7', ...
          'F5', 'F3', 'F1', 'Fz', 'F2', 'F4', 'F6', 'F8', 'FT7', 'FT8', ...
          'T7', 'T8', 'T9', 'T10', 'TP7', 'TP8', 'P7', 'P5', 'P3', 'P1', ...
          'Pz', 'P2', 'P4', 'P6', 'P8', 'PO7', 'PO3', 'POz', 'PO4', 'PO8', ...
          'O1', 'Oz', 'O2', 'Iz'};
  
%   x = {  1,  1,  1,  1,  1,  1,  1,  0,  0,  0, ...
%          0,  0,  0,  0, -1, -1, -1, -1, -1, -1, ...
%         -1,  4,  4,  4,  3,  3,  3,  3,  3,  2, ...
%          2,  2,  2,  2,  2,  2,  2,  2,  1,  1, ...
%          0,  0,  0,  0, -1, -1, -2, -2, -2, -2, ...
%         -2, -2, -2, -2, -2, -3, -3, -3, -3, -3, ...
%         -4, -4, -4, -5};
      
  x = { -10, -6.9, -3.9, -1, 2, 5, 8, -10, -7, -4, ...
        -1, 2, 5, 8, -10, -7, -3.9, -1, 2, 5, ...
        8, -5, -1, 5, -9.5, -5.4, -1, 5, 8, -12.5, ...
        -9.5, -6.5, -3.8, -1, 2, 5, 8, 11, -13, 11, ...
        -13, 11, -16, 14, -13, 11, -13, -9.5, -6.5, -3.8, ...
        -1, 2, 5, 8, 11, -9.5, -5.4, -1, 5, 8, ...
        -5, -1, 5, -1};
      
%   y = {  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, ...
%          0,  0,  0,  0, -1, -1, -1, -1, -1, -1, ...
%         -1,  4,  4,  4,  3,  3,  3,  3,  3,  2, ...
%          2,  2,  2,  2,  2,  2,  2,  2,  1,  1, ...
%          0,  0,  0,  0, -1, -1, -2, -2, -2, -2, ...
%         -2, -2, -2, -2, -2, -3, -3, -3, -3, -3, ...
%         -4, -4, -4, -5};
  
  y = {  2,  2,  2,  2,  2,  2,  2,  -1,  -1,  -1, ...
        -1, -1, -1, -1, -4, -4, -4, -4, -4, -4, ...
        -4, 11,  11,  11,  8,  8,  8,  8,  8,  5, ...
         5,  5,  5,  5,  5,  5,  5,  5,  2,  2, ...
        -1, -1, -1, -1, -4, -4, -7, -7, -7, -7, ...
        -7, -7, -7, -7, -7, -10, -10, -10, -10, -10, ...
        -13, -13, -13, -16};
      
  w = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1};
  h = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
       1, 1, 1, 1};
  
  channels = struct('Nro',Nro,'Nome',Nome,'x',x,'y',y,'w',w,'h',h);
  

  channels2 = [
    -9.5 0 %ch1
    -7.2 0
    -4.9 0
    -2.6 0
      0  0 %ch2
     9.5 0 %ch3
    %ch4
    %ch5
    %ch11
  ];
end