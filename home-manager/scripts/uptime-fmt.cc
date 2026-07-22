#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <ctime>
#include <string_view>
#include <utility>

int main() {
  FILE    *fp       = popen("cat /proc/uptime", "r");
  char    *time_str = 0;
  uint64_t uptime, _;

  getline(&time_str, &_, fp);
  sscanf(time_str, "%lu", &uptime);
  pclose(fp);
  free(time_str);

  auto [hours, minutes] = std::div(uptime / 60, 60L);
  if (hours != 0)
    printf("%lu %s%s, ", hours, "hour", hours > 1 ? "s" : "");
  printf("%lu %s%s", minutes, "minute", minutes != 1 ? "s" : "");
  puts("");
}
