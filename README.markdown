# Numb Window

Sheet.xib contains a panel that is improperly set as Release When Closed. SheetOwner retains it in order to reuse the panel every time, but RWC means the panel dies off (or should die off) before any such reuse can happen.

That's where things get weird…

STR:

1. Run the application.
2. Click “Show sheet”.
3. Click OK or Cancel.
4. Click “Show sheet”.

Expected:
RWC released the sheet, which should only be owned by the SheetOwner, so trying to show it again should cause some kind of crash.

Actual:
No crash. If you run it in the debugger (either one, gdb or lldb), it doesn't stop the program; no SIGBUS, SIGSEGV, SIGTRAP, or other signal is received. If you run it in Instruments using the Zombies template, you do not get a zombie moan. Furthermore, Instruments reveals that the sheet's retain count is brought down by the close message to *2*, and no lower.

Even weirder, the sheet panel goes numb when it is shown the second time, as does every view in it. It responds neither to clicks nor to keypresses. However, the application is not crashed: Anything outside of the window, including the menus, the About panel, and the Font Panel, works just fine.
