function file_write(name, opt, cost, messages, takes)

file = fopen(name, 'w');

fprintf(file, "%s\n", datestr(takes, "HH:MM"));
fprintf(file, "%.3f\n", cost);
fprintf(file, "%i ", opt);
fprintf(file, "\n");

for msg = messages
    fprintf(file, "%s", msg);
end

fclose(file);

end
