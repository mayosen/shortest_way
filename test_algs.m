file = fopen('lengths.txt', 'r');
lengths2 = fscanf(file, '%f %f %f %f %f %f %f %f %f %f\n', [10 10]);
fclose(file);

