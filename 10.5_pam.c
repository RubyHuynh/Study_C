/*#include <security/pam_appl.h>
#include <security/pam_misc.h>
#include <stdio.h>

int main ()
{
    pam_handle_t* pamh;
    struct pam_conv pamc;
    pamc.conv = &misc_conv;
    pamc.appdata_ptr = NULL;

    pam_start ("su", getenv ("USER"), &pamc, &pamh);
    if (pam_authenticate (pamh, 0) != PAM_SUCCESS)
        fprintf (stderr, "Authentication failed!\n");
    else
        fprintf (stderr, "Authentication OK.\n");
    pam_end (pamh, 0);
    return 0;
}
*/


/*
ldd `which su` --> should have libpam.so
sudo apt-get install libpam0g-dev
gcc -o pam pam.c -lpam -lpam_misc
  */