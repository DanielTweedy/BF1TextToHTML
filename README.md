# BF1TextToHTML
Simple Bash script (may change to makefile) that takes stats on in game weapons in text files and converts them to text files with HTML tags for making a table with them. Text files should be formated in the same way as seen in this reddit post https://www.reddit.com/r/battlefield_one/comments/4qzj9x/battlefield_1_alpha_weapon_stats/.

## How to use:
1. Start by parsing out the original text file into a bunch of smaller text files with the file extentsion `.weapon` that contain a single weapon and their stats in a consistant format like the xaa.weapon file.
  - Note: This can easily be done with the `WeaponSplit.bash` script or the `split` UNIX command.
2. Next you will need a text file called `heads` that contains all the table headers like "Weapon", "Max Damage", etc. all seperated by newline characters.
  - Note: it is important that there be as many headers in the text file as there are lines of items in the weapon text files.
  - An easy way to make a header file is using the UNIX `cut` command with a weapon file
    1. Using the '=' character as a deliminator.
    2. Ignoring lines without the '=' character.
    3. Choosing the first feild.
    4. Adding a "Weapon" or "Name" feild to the text file where the weapons name will be displayed in the table.
3. Once all the `.weapon` files have been parsed from the text file, have the, run the `TextToHTML.bash` script in the same directory as the weapon and head file and redirect the output to a `.html` file.
4. ????
5. Profit?
6. Import it in a spreadsheet program like Google Sheets, MS Excel, or Libre Math.
7. You probably have a better idea than I do at this point.
