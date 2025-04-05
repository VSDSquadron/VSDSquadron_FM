#include <stdio.h>

/* Some ANSI color sequences */
#define ANSI_RED     "\033[31m"
#define ANSI_GREEN   "\033[32m"
#define ANSI_YELLOW  "\033[33m"
#define ANSI_BLUE    "\033[34m"
#define ANSI_MAGENTA "\033[35m"
#define ANSI_CYAN    "\033[36m"
#define ANSI_WHITE   "\033[37m"
#define ANSI_RESET   "\033[0m"

/*
   ASCII art for "HELLO".  The final line includes "from VSDSQUADRON FPGA"
   so it’s part of the fancy message.
*/
static const char* hello_art[] = {
    // ANSI_GREEN"  _   _      _ _         _____       "ANSI_RESET,
    // ANSI_GREEN" | | | |    | | |       / ____|      "ANSI_RESET,
    // ANSI_GREEN" | |_| | ___| | | ___  | (___        "ANSI_RESET,
    // ANSI_GREEN" |  _  |/ _ \\ | |/ _ \\  \\___ \\       "ANSI_RESET,
    // ANSI_GREEN" | | | |  __/ | | (_) | ____) |      "ANSI_RESET,
    // ANSI_GREEN" |_| |_|\\___|_|_|\\___/ |_____/       "ANSI_RESET,
    ANSI_GREEN" _    _      _ _        "ANSI_RESET,
    ANSI_GREEN"| |  | |    | | |       "ANSI_RESET,
    ANSI_GREEN"| |__| | ___| | | ___   "ANSI_RESET,
    ANSI_GREEN"|  __  |/ _ \\ | |/ _ \\  "ANSI_RESET,
    ANSI_GREEN"| |  | |  __/ | | (_) | "ANSI_RESET,
    ANSI_GREEN"|_|  |_|\\___|_|_|\\___/  "ANSI_RESET,
    "",  /* blank line */
    ANSI_BLUE" __          __        _     _ "ANSI_RESET,
    ANSI_BLUE" \\ \\        / /       | |   | |"ANSI_RESET,
    ANSI_BLUE"  \\ \\  /\\  / /__  _ __| | __| |"ANSI_RESET,
    ANSI_BLUE"   \\ \\/  \\/ / _ \\| '__| |/ _` |"ANSI_RESET,
    ANSI_BLUE"    \\  /\\  / (_) | |  | | (_| |"ANSI_RESET,
    ANSI_BLUE"     \\/  \\/ \\___/|_|  |_|\\__,_|"ANSI_RESET,
    "",  /* blank line */
    ANSI_MAGENTA"             from VSDSQUADRON FM"ANSI_RESET,
    NULL
};

int main(void) {
    /* Clear screen, move cursor to top-left */
    printf("\033[2J\033[H");

    /* Print each line of our ASCII-art banner */
    for (int i = 0; hello_art[i] != NULL; i++) {
        printf("%s\n", hello_art[i]);
    }

    /* Reset text attributes, move to next line */
    printf(ANSI_RESET "\n");

    return 0;
}
