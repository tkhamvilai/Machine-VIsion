clear all; clc; close all;
A =[

     3     3;
     3     1;
     3     3;
     2     1;
     2     2;
     1     2;
     3     3;
     1     3;
     1     1;
     1     2;
     1     2;
     3     2];
 
 [A_unique,~,u_id] = unique(A, 'rows');
 occurrences = histc(u_id, unique(u_id));