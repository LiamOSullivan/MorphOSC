{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 5,
			"minor" : 1,
			"revision" : 9
		}
,
		"rect" : [ 0.0, 63.0, 1440.0, 773.0 ],
		"bglocked" : 0,
		"defrect" : [ 0.0, 63.0, 1440.0, 773.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 9.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Harmonicity",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-116",
					"presentation_rect" : [ 124.876068, 217.421509, 71.314064, 22.0 ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 518.264465, 369.48761, 71.314064, 22.0 ],
					"presentation" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ModIndex",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-115",
					"presentation_rect" : [ 4.090947, 217.421509, 57.264481, 22.0 ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 402.438019, 369.48761, 57.264481, 22.0 ],
					"presentation" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"outlettype" : [ "" ],
					"floatoutput" : 1,
					"id" : "obj-114",
					"presentation_rect" : [ 96.115685, 157.27272, 20.0, 140.0 ],
					"numinlets" : 1,
					"patching_rect" : [ 491.156982, 369.48761, 20.0, 140.0 ],
					"presentation" : 1,
					"size" : 1.0,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"outlettype" : [ "" ],
					"floatoutput" : 1,
					"id" : "obj-112",
					"presentation_rect" : [ 67.89254, 157.148758, 20.0, 140.0 ],
					"numinlets" : 1,
					"patching_rect" : [ 462.933838, 369.48761, 20.0, 140.0 ],
					"presentation" : 1,
					"size" : 1.0,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0.734915 0",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-108",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 220.380157, 416.123962, 107.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-110",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 222.380157, 388.123962, 67.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s play",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-107",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 71.049583, 358.438019, 37.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-106",
					"numinlets" : 1,
					"patching_rect" : [ 12.082684, 303.528931, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-105",
					"numinlets" : 1,
					"patching_rect" : [ 372.661133, 305.429749, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-104",
					"numinlets" : 1,
					"patching_rect" : [ 303.115692, 305.305786, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-103",
					"numinlets" : 1,
					"patching_rect" : [ 225.305771, 309.314056, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-100",
					"numinlets" : 1,
					"patching_rect" : [ 114.438042, 308.363647, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Message Format: ParamName (ID) | Value  | ID",
					"linecount" : 2,
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-99",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 93.471054, 215.892563, 221.0, 37.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-98",
					"numinlets" : 1,
					"patching_rect" : [ 496.132233, 261.132233, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /morphOSC",
					"outlettype" : [ "", "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-97",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 67.818176, 162.123978, 97.0, 22.0 ],
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0.901568 0",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-88",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 31.0, 416.0, 107.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-96",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 33.0, 388.0, 67.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s modIndex",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-48",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 10.595043, 335.173553, 65.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-50",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 87.0, 335.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-62",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 40.0, 306.0, 57.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1",
					"outlettype" : [ "int" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-95",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 477.0, 623.0, 32.5, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-90",
					"numinlets" : 1,
					"patching_rect" : [ 568.131531, 629.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend mute",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-89",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 511.0, 640.0, 66.0, 17.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "mute instance number",
					"fontname" : "Arial",
					"id" : "obj-87",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 109.0, 631.0, 150.0, 17.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "mute 0",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-86",
					"fontsize" : 9.0,
					"numinlets" : 2,
					"patching_rect" : [ 543.0, 679.0, 50.0, 15.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-85",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 541.0, 659.0, 58.0, 17.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"fontname" : "Arial",
					"id" : "obj-84",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 517.190063, 536.231384, 50.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r dur",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-83",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 532.0, 561.0, 34.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-80",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 867.0, 331.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-81",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 825.0, 303.0, 61.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s dum",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-82",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 823.0, 332.0, 39.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-77",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 784.0, 333.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-78",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 742.0, 305.0, 61.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s dur",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-79",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 740.0, 334.0, 34.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"outlettype" : [ "bang", "int" ],
					"fontname" : "Arial",
					"id" : "obj-76",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 88.0, 464.0, 32.5, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter 0 5",
					"outlettype" : [ "int", "", "", "int" ],
					"fontname" : "Arial",
					"id" : "obj-65",
					"fontsize" : 9.0,
					"numinlets" : 5,
					"patching_rect" : [ 87.0, 441.0, 73.0, 17.0 ],
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "uzi 10",
					"outlettype" : [ "bang", "bang", "int" ],
					"fontname" : "Arial",
					"id" : "obj-64",
					"fontsize" : 9.0,
					"numinlets" : 2,
					"patching_rect" : [ 87.0, 418.0, 46.0, 17.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"orientation" : 2,
					"interp" : 0.0,
					"outlettype" : [ "signal", "int" ],
					"id" : "obj-75",
					"numinlets" : 2,
					"patching_rect" : [ 147.0, 739.174072, 28.0, 58.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r posY",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-70",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 482.0, 566.0, 40.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r posX",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-66",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 437.0, 569.0, 41.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-73",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 702.0, 333.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-74",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 660.0, 305.0, 61.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-71",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 628.0, 333.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-72",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 586.0, 305.0, 61.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"fontname" : "Arial",
					"id" : "obj-69",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 106.0, 373.0, 48.0, 17.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Mute all",
					"fontname" : "Arial",
					"id" : "obj-67",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 129.0, 396.0, 150.0, 17.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-63",
					"numinlets" : 1,
					"patching_rect" : [ 103.0, 393.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "4",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-42",
					"fontsize" : 11.595187,
					"numinlets" : 2,
					"patching_rect" : [ 287.0, 505.0, 32.5, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "3",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-45",
					"fontsize" : 11.595187,
					"numinlets" : 2,
					"patching_rect" : [ 253.0, 503.0, 32.5, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"outlettype" : [ "float", "bang" ],
					"fontname" : "Arial",
					"id" : "obj-36",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"minimum" : 0.0,
					"patching_rect" : [ 356.0, 502.0, 50.0, 17.0 ],
					"maximum" : 1.0,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-56",
					"numinlets" : 1,
					"patching_rect" : [ 154.0, 569.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-53",
					"numinlets" : 1,
					"patching_rect" : [ 245.0, 552.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-52",
					"numinlets" : 1,
					"patching_rect" : [ 243.0, 575.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s harm",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-23",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 165.0, 330.0, 42.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-31",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 208.0, 331.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-32",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 166.826447, 302.826447, 57.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-21",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 535.0, 326.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-22",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 471.0, 304.0, 61.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-19",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 447.0, 328.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-20",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 401.0, 306.0, 61.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-2",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 358.0, 329.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-15",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 314.0, 302.0, 61.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Message Format:/morphOSC | layerID | nParams  | paramID | val | ...",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-1",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 703.966919, 136.305786, 354.785126, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s attack",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-54",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 244.0, 355.0, 45.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s ID",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-43",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 285.0, 331.0, 31.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"outlettype" : [ "int" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-60",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 109.0, 535.0, 32.5, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "2",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-59",
					"fontsize" : 11.595187,
					"numinlets" : 2,
					"patching_rect" : [ 214.0, 502.0, 32.5, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-58",
					"fontsize" : 11.595187,
					"numinlets" : 2,
					"patching_rect" : [ 146.0, 500.0, 32.5, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-57",
					"fontsize" : 11.595187,
					"numinlets" : 2,
					"patching_rect" : [ 180.0, 500.0, 32.5, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0",
					"outlettype" : [ "float", "int" ],
					"fontname" : "Arial",
					"id" : "obj-30",
					"fontsize" : 9.0,
					"numinlets" : 1,
					"patching_rect" : [ 243.0, 303.0, 61.0, 17.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-51",
					"numinlets" : 1,
					"patching_rect" : [ 132.131531, 662.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 100",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-47",
					"fontsize" : 14.0,
					"numinlets" : 1,
					"patching_rect" : [ 131.0, 693.347656, 84.0, 24.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-101",
					"fontsize" : 14.0,
					"numinlets" : 1,
					"patching_rect" : [ 145.0, 820.347656, 74.0, 24.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "startwindow",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-102",
					"fontsize" : 14.0,
					"numinlets" : 2,
					"patching_rect" : [ 145.0, 850.347656, 87.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gain~",
					"orientation" : 2,
					"interp" : 0.0,
					"outlettype" : [ "signal", "int" ],
					"id" : "obj-18",
					"numinlets" : 2,
					"patching_rect" : [ 108.0, 737.347656, 28.0, 58.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezdac~",
					"id" : "obj-109",
					"numinlets" : 2,
					"patching_rect" : [ 109.389465, 818.737183, 33.0, 33.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r play",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-3",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 155.0, 536.0, 37.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r points",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-9",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 343.0, 569.0, 46.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r harm",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-10",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 389.0, 569.0, 47.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r size",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-11",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 309.0, 568.0, 34.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r modIndex",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-12",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 266.0, 547.0, 65.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r mute",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-13",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 220.0, 525.0, 42.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r ID",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-14",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 111.0, 496.0, 31.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "target $1",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"id" : "obj-55",
					"fontsize" : 11.595187,
					"numinlets" : 2,
					"patching_rect" : [ 96.0, 567.0, 54.0, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ FMSynth1 5",
					"outlettype" : [ "signal", "signal", "", "", "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-44",
					"fontsize" : 12.0,
					"numinlets" : 11,
					"patching_rect" : [ 99.0, 599.0, 469.0, 22.0 ],
					"numoutlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s posY",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-17",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 661.0, 332.0, 40.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s posX",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-16",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 584.0, 334.0, 41.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s points",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-6",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 484.0, 327.0, 50.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s period",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-7",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 393.0, 328.0, 51.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s size",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-8",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 318.0, 330.0, 37.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "OSC IN",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-92",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 289.0, 72.0, 68.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "maxpacketsize 128",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-61",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 153.0, 68.0, 99.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r status",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-46",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 707.900818, 558.553711, 44.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route 0 1 2 3 4 5 6 7 8 9",
					"outlettype" : [ "", "", "", "", "", "", "", "", "", "", "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-24",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 70.173553, 259.52066, 363.0, 22.0 ],
					"color" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"numoutlets" : 11
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-25",
					"numinlets" : 1,
					"patching_rect" : [ 177.0, 142.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/morphOSCdrag 1 0.735477 0",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-26",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 227.0, 176.0, 217.74379, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-27",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 229.0, 148.0, 67.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "maxqueuesize 4096",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-28",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 140.0, 50.0, 103.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"id" : "obj-29",
					"numinlets" : 1,
					"patching_rect" : [ 692.198364, 599.595032, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "print receivedmess",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-33",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 229.0, 124.0, 98.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "maxpacketsize 2048",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-34",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 771.900818, 526.553711, 105.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "maxqueuesize 1024",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-35",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 779.900818, 550.553711, 103.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "port 7401",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-37",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 791.900818, 572.553711, 60.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "host 127.0.0.1",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-39",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 799.900818, 593.553711, 80.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 8001",
					"outlettype" : [ "" ],
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-40",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 177.0, 97.0, 87.0, 22.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 127.0.0.1 7401",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-41",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 737.900818, 655.553711, 127.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "OSC OUT",
					"fontname" : "Adobe Garamond Pro",
					"id" : "obj-93",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 872.900818, 616.553711, 66.0, 22.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.317647, 0.658824, 0.686275, 1.0 ],
					"id" : "obj-94",
					"numinlets" : 1,
					"patching_rect" : [ 670.900818, 517.553711, 362.0, 183.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-49",
					"numinlets" : 1,
					"patching_rect" : [ 71.900833, 217.355347, 381.718994, 28.000008 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"bgcolor" : [ 0.454902, 0.176471, 0.101961, 1.0 ],
					"id" : "obj-91",
					"numinlets" : 1,
					"patching_rect" : [ 336.876007, 706.421448, 976.0, 334.0 ],
					"numoutlets" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-114", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-112", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 1 ],
					"destination" : [ "obj-110", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-110", 0 ],
					"destination" : [ "obj-108", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 1 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 1 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 1 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-107", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-44", 6 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-106", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 4 ],
					"destination" : [ "obj-105", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 3 ],
					"destination" : [ "obj-104", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 2 ],
					"destination" : [ "obj-103", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 1 ],
					"destination" : [ "obj-100", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-96", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 9 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 8 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 7 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 6 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 2 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 5 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 4 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 3 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-97", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 10 ],
					"destination" : [ "obj-98", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-97", 0 ],
					"hidden" : 0,
					"midpoints" : [ 186.5, 126.0, 77.318176, 126.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-44", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-102", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-102", 0 ],
					"destination" : [ "obj-109", 0 ],
					"hidden" : 0,
					"midpoints" : [ 154.5, 810.347656, 118.889465, 810.347656 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-44", 4 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-44", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 1 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-109", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 1 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 1 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 1 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 781.400818, 587.553711, 747.400818, 587.553711 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 789.400818, 608.553711, 747.400818, 608.553711 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-44", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 801.400818, 636.553711, 747.400818, 636.553711 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.400818, 649.553711, 747.400818, 649.553711 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 1 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 4 ],
					"destination" : [ "obj-90", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 4 ],
					"destination" : [ "obj-95", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-44", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-44", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-64", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-44", 7 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-44", 8 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 1 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 1 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-109", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-76", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-76", 1 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 1 ],
					"destination" : [ "obj-77", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 1 ],
					"destination" : [ "obj-80", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-82", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-44", 9 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-44", 9 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-89", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-89", 0 ],
					"destination" : [ "obj-85", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-44", 5 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-95", 0 ],
					"destination" : [ "obj-89", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-96", 0 ],
					"destination" : [ "obj-88", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [ 162.5, 87.0, 186.5, 87.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 186.5, 135.0, 186.5, 135.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [ 149.5, 87.0, 186.5, 87.0 ]
				}

			}
 ]
	}

}
