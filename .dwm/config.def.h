/* See LICENSE file for copyright and license details. */

/* appearance */
static const char *fonts[] = {
	"monospace:size=9",
	"FontAwesome:size=10",
};
static const char dmenufont[]       = "monospace:size=9";
static const char normbordercolor[] = "#B91A26";
static const char normbgcolor[]     = "#282A2E";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#B91A26";
static const char selbgcolor[]      = "#B91A26";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */

/* tagging */
// 1 terminals 2 code 3 social 4 pics/videos 5 files 6 docs 7 internet
static const char *tags[] = { "", "", "", "", "", "", "" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 6,       0,           -1 },
	{ "Chromium", NULL,       NULL,       1 << 6,       0,           -1 },
	{ NULL,       NULL,       "Cmus",     1 << 3,       0,           -1 },
	{ "Thunderbird", NULL,    NULL,       1 << 2,       0,           -1 },
	{ "Deluge",   NULL,       NULL,       1 << 2,       0,           -1 },
	{ "Fatrat",   NULL,       NULL,       1 << 2,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ " ",      tile },    /* first entry is default */
	{ " ",      NULL },    /* no layout function means floating behavior */
	{ " ",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "sakura", NULL };
static const char *nautiluscmd[]  = { "nautilus", NULL };
static const char *firefoxcmd[]  = { "firefox", NULL };
static const char *chromiumcmd[]  = { "chromium", NULL };
static const char *geditcmd[]  = { "gedit", NULL };
static const char *cmuscmd[]     = { "sakura", "-t", "Cmus", "-e", "cmus", NULL };
static const char *rangercmd[]     = { "sakura", "-e", "ranger", NULL };
static const char *volmcmd[]    = { "pamixer", "-t", NULL };
static const char *voldcmd[]     = { "pamixer", "-d", "5", NULL };
static const char *volucmd[]     = { "pamixer", "-i", "5", NULL };
static const char *calculator[]  = { "gnome-calculator", NULL };
static const char *mailcmd[]  = { "thunderbird", NULL };
static const char *printscr[]  = { "gnome-screenshot", NULL };
static const char *gtermcmd[]  = { "gnome-terminal", NULL };
static const char *mymenucmd[]  = { "mygtkmenu", "/home/tolga/.config/mygtkmenu.conf", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ControlMask,           XK_n, 	   spawn,          {.v = nautiluscmd } },
	{ MODKEY|ControlMask,           XK_f,      spawn,     	   {.v = firefoxcmd } },
	{ MODKEY|ControlMask,           XK_c,      spawn,     	   {.v = chromiumcmd } },
	{ MODKEY|ControlMask,           XK_g,      spawn,     	   {.v = geditcmd } },
        { MODKEY|ControlMask,           XK_m,      spawn,     	   {.v = cmuscmd } },
        { MODKEY|ControlMask,           XK_r,      spawn,     	   {.v = rangercmd } },
        { 0,                            0x1008ff12, spawn,         {.v = volmcmd } },
	{ 0,                            0x1008ff11, spawn,         {.v = voldcmd } },
	{ 0,                            0x1008ff13, spawn,         {.v = volucmd } },
	{ 0,                            0x1008ff1d, spawn,         {.v = calculator } },
	{ 0,                            0x1008ff19, spawn,         {.v = mailcmd } },
	{ MODKEY,                       0xff61,     spawn,         {.v = printscr } },
	{ MODKEY|ControlMask,           XK_t,	   spawn,          {.v = gtermcmd } },
	{ 0,                            0x1008ff18, spawn,         {.v = mymenucmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkRootWin,		0,      	Button2,        spawn,          {.v = mymenucmd } },
};

