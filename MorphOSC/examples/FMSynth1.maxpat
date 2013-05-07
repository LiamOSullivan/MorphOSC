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
		"default_fontsize" : 12.0,
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
					"maxclass" : "newobj",
					"text" : "t b i",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-61",
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 258.0, 39.0, 42.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "out 3",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"id" : "obj-66",
					"fontsize" : 12.0,
					"patching_rect" : [ 460.0, 337.0, 90.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-56",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 498.201782, 369.347656, 75.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-58",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 499.0, 391.0, 63.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 1000",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-62",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 444.0, 234.0, 69.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-63",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 405.0, 262.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "thispoly~",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-55",
					"outlettype" : [ "int", "int" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 459.0, 286.0, 58.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 11",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-54",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 589.0, 23.0, 36.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "duration",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-51",
					"fontsize" : 14.0,
					"patching_rect" : [ 355.0, 2.0, 114.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 10",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-34",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 308.0, 4.0, 37.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 1000",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-33",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 358.0, 25.0, 92.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-47",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 402.201782, 121.347656, 139.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "setdomain 1000",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-49",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 403.0, 143.0, 127.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-46",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 251.0, 12.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "setdomain $1",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-45",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 272.0, 73.0, 84.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "/ 2",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-44",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 165.0, 251.0, 32.5, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "getdomain",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-41",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 254.0, 120.0, 117.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-36",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 338.0, 282.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-37",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 282.0, 282.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0. 0.",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-38",
					"outlettype" : [ "float", "float" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 281.0, 259.0, 75.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-39",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 200.0, 252.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route domain range",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 3,
					"id" : "obj-40",
					"outlettype" : [ "", "", "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 219.0, 216.0, 134.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "delay 500",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-19",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 52.0, 7.0, 63.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number~",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-29",
					"mode" : 2,
					"outlettype" : [ "signal", "float" ],
					"sig" : 0.0,
					"fontsize" : 12.0,
					"patching_rect" : [ 980.0, 894.0, 56.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number~",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-28",
					"mode" : 2,
					"outlettype" : [ "signal", "float" ],
					"sig" : 0.0,
					"fontsize" : 12.0,
					"patching_rect" : [ 801.0, 892.0, 56.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "out~ 2",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"id" : "obj-27",
					"fontsize" : 12.0,
					"patching_rect" : [ 925.0, 889.0, 44.0, 20.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "out~ 1",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"id" : "obj-26",
					"fontsize" : 12.0,
					"patching_rect" : [ 863.0, 890.0, 44.0, 20.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-24",
					"outlettype" : [ "signal" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 918.0, 844.0, 32.5, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Arial",
					"minimum" : 0.0,
					"numoutlets" : 2,
					"id" : "obj-22",
					"maximum" : 1.0,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 928.0, 595.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Y",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-175",
					"fontsize" : 14.0,
					"patching_rect" : [ 516.0, 185.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "X",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-174",
					"fontsize" : 14.0,
					"patching_rect" : [ 1024.0, 598.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 9",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-173",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 510.0, 215.0, 30.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 8",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-172",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 986.0, 602.0, 30.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "R Gain",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"id" : "obj-146",
					"fontsize" : 11.595187,
					"patching_rect" : [ 962.0, 844.0, 47.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "L Gain",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 0,
					"id" : "obj-147",
					"fontsize" : 11.595187,
					"patching_rect" : [ 803.0, 846.0, 45.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "split 0. 0.5",
					"numinlets" : 3,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-156",
					"outlettype" : [ "float", "float" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 986.0, 633.0, 63.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "/ 1.",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-158",
					"outlettype" : [ "float" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 986.0, 662.0, 32.5, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "/ 1.",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-161",
					"outlettype" : [ "float" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 1044.0, 662.0, 32.5, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "line~ 0.5",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 2,
					"id" : "obj-165",
					"outlettype" : [ "signal", "bang" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 986.0, 719.0, 55.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 20",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-166",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 986.0, 693.0, 40.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sig~ 1.",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-167",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 932.0, 719.0, 45.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "-~",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-168",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187,
					"patching_rect" : [ 932.0, 754.0, 32.5, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-6",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 122.0, 230.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Mute",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-18",
					"fontsize" : 14.0,
					"patching_rect" : [ 153.0, 4.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Play",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-13",
					"fontsize" : 14.0,
					"patching_rect" : [ 9.0, 11.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Period",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-12",
					"fontsize" : 14.0,
					"patching_rect" : [ 168.0, 341.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Points",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-5",
					"fontsize" : 14.0,
					"patching_rect" : [ 53.0, 382.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Size",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-2",
					"fontsize" : 14.0,
					"patching_rect" : [ 401.0, 69.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Curve",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-1",
					"fontsize" : 14.0,
					"patching_rect" : [ 348.0, 397.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"numinlets" : 2,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-35",
					"outlettype" : [ "signal" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 858.0, 845.0, 32.5, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 6",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-25",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 53.0, 408.0, 30.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 5",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-17",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 369.0, 71.0, 30.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 4",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-16",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 314.0, 399.0, 30.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 3",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-8",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 119.0, 1.0, 30.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 2",
					"numinlets" : 1,
					"fontname" : "Arial",
					"numoutlets" : 1,
					"id" : "obj-7",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"patching_rect" : [ 21.0, 65.0, 30.0, 20.0 ],
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0.7",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"hidden" : 1,
					"numoutlets" : 1,
					"id" : "obj-59",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 1137.0, 135.0, 35.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"hidden" : 1,
					"numoutlets" : 1,
					"id" : "obj-53",
					"outlettype" : [ "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 1139.0, 96.0, 58.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Pentatonic scale: 110/5",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-196",
					"fontsize" : 14.0,
					"patching_rect" : [ 79.0, 499.0, 201.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-190",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 91.201782, 520.347656, 75.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "-66",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-191",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 92.0, 542.0, 62.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "- 1.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-189",
					"outlettype" : [ "float" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 44.868469, 473.347656, 46.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-187",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 39.201782, 627.347656, 75.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "44.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-188",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 40.0, 649.0, 63.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 22",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-186",
					"outlettype" : [ "int" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 43.868469, 492.347656, 47.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-185",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 111.201782, 463.347656, 75.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0 3",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-184",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 180.0, 473.0, 63.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r baseFreq",
					"numinlets" : 0,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-183",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 1023.0, 67.0, 66.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s baseFreq",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-182",
					"fontsize" : 14.0,
					"patching_rect" : [ 49.0, 598.0, 66.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "spectroscope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"domain" : [ 0.0, 12000.0 ],
					"id" : "obj-180",
					"presentation_rect" : [ 71.0, 61.0, 699.0, 351.0 ],
					"outlettype" : [ "" ],
					"interval" : 100,
					"logfreq" : 1,
					"patching_rect" : [ 827.067871, 425.400269, 197.0, 109.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-77",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 786.0, 118.0, 18.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "analog $1",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-78",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 806.0, 118.0, 64.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-83",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 696.0, 169.0, 18.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "logfreq $1",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-84",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 718.0, 169.0, 64.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-85",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 696.0, 207.0, 18.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "phasespect $1",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-86",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 718.0, 207.0, 83.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-88",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 696.0, 245.0, 18.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "numdisplay $1",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-89",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 718.0, 245.0, 89.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-90",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 696.0, 226.0, 18.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "dbdisplay $1",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-98",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 718.0, 226.0, 78.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "range 0.25 4",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-103",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 695.0, 309.5, 79.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "range 0.125 8",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-104",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 695.0, 289.5, 86.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-108",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 696.0, 188.0, 18.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "logamp $1",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-110",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 718.0, 188.0, 66.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"hidden" : 1,
					"numoutlets" : 1,
					"id" : "obj-113",
					"outlettype" : [ "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 678.0, 116.0, 58.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set 3",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"hidden" : 1,
					"numoutlets" : 1,
					"id" : "obj-114",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 671.0, 151.0, 36.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-115",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 786.0, 96.0, 18.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "gainmode $1",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-116",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 806.0, 96.0, 82.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"types" : [  ],
					"numoutlets" : 3,
					"id" : "obj-117",
					"outlettype" : [ "int", "", "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 732.0, 145.0, 70.0, 24.0 ],
					"items" : [ "display", ",", "lowpass", ",", "highpass", ",", "bandpass", ",", "bandstop", ",", "peaknotch", ",", "lowshelf", ",", "highshelf", ",", "resonant", ",", "allpass" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "bandwidth",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-120",
					"fontsize" : 14.0,
					"patching_rect" : [ 1012.0, 363.0, 67.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "gain",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-121",
					"fontsize" : 14.0,
					"patching_rect" : [ 914.0, 365.0, 31.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "freq",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-123",
					"fontsize" : 14.0,
					"patching_rect" : [ 867.0, 363.0, 30.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Q or S",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-125",
					"fontsize" : 14.0,
					"patching_rect" : [ 964.0, 363.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-126",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 1007.666626, 337.0, 50.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-135",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 960.0, 337.0, 49.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-136",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 912.333374, 337.0, 50.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-139",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 864.666626, 337.0, 49.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-149",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 680.0, 345.0, 36.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~ 0.7",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-150",
					"outlettype" : [ "signal" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 736.0, 405.0, 46.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "biquad~",
					"numinlets" : 6,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-157",
					"outlettype" : [ "signal" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 724.0, 376.0, 86.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Q or S",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-159",
					"fontsize" : 14.0,
					"patching_rect" : [ 1174.0, 136.0, 45.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-160",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 1123.0, 172.0, 54.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-162",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 1072.0, 172.0, 53.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-163",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 1021.0, 172.0, 54.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "range 0.0625 16",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-164",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 695.0, 269.0, 100.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "filtergraph~",
					"numinlets" : 8,
					"fontname" : "Adobe Garamond Pro",
					"fgcolor" : [ 0.756863, 0.756863, 1.0, 1.0 ],
					"numoutlets" : 7,
					"domain" : [ 0.0, 22050.0 ],
					"hcurvecolor" : [ 1.0, 0.086275, 0.086275, 1.0 ],
					"id" : "obj-169",
					"bwidthcolor" : [ 0.462745, 0.47451, 0.65098, 1.0 ],
					"autoout" : 1,
					"outlettype" : [ "list", "float", "float", "float", "float", "list", "int" ],
					"hbwidthcolor" : [ 0.823529, 0.290196, 0.211765, 1.0 ],
					"bgcolor" : [ 0.913725, 0.913725, 1.0, 1.0 ],
					"fontsize" : 14.0,
					"markercolor" : [ 0.509804, 0.509804, 0.509804, 1.0 ],
					"patching_rect" : [ 817.0, 200.0, 305.0, 132.0 ],
					"range" : [ 0.125, 8.0 ],
					"nfilters" : 1,
					"setfilter" : [ 0, 2, 0, 0, 0, 44.0, 1.0, 0.7, 0.0001, 22050.0, 0.0001, 16.0, 0.5, 25.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "cutoff or center freq",
					"linecount" : 3,
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-170",
					"fontsize" : 14.0,
					"patching_rect" : [ 1024.0, 99.0, 61.0, 60.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "gain (linear)",
					"linecount" : 2,
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-171",
					"fontsize" : 14.0,
					"patching_rect" : [ 1089.0, 108.0, 48.0, 42.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-79",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 310.868469, 435.347656, 52.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "scale 6 26 1 12",
					"numinlets" : 6,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-76",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 52.868469, 433.347656, 124.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 110.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-75",
					"outlettype" : [ "float" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 43.868469, 520.347656, 47.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-74",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 300.868469, 504.347656, 47.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "spectroscope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"domain" : [ 0.0, 12000.0 ],
					"id" : "obj-73",
					"presentation_rect" : [ 56.0, 46.0, 699.0, 351.0 ],
					"outlettype" : [ "" ],
					"interval" : 100,
					"logfreq" : 1,
					"patching_rect" : [ 521.067871, 636.400269, 197.0, 109.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "append 10",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-21",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 301.868469, 542.347656, 84.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "line~ 10.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-57",
					"outlettype" : [ "signal", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 302.868469, 567.347656, 58.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "scale 0. 1. 0. 1.",
					"numinlets" : 6,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-11",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 184.868469, 427.347656, 124.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number~",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-10",
					"mode" : 2,
					"outlettype" : [ "signal", "float" ],
					"sig" : 0.0,
					"fontsize" : 14.0,
					"patching_rect" : [ 430.363037, 662.958252, 57.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-4",
					"outlettype" : [ "signal" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 155.868469, 709.347656, 142.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"minimum" : 0.0,
					"numoutlets" : 2,
					"id" : "obj-3",
					"maximum" : 5.0,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 398.868408, 525.347656, 37.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "append 10",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-72",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 426.868469, 615.347656, 84.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "line~ 10.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-60",
					"outlettype" : [ "signal", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 427.868469, 640.347656, 58.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "scale 0.1 4. 0. 1.",
					"numinlets" : 6,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-30",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 426.868469, 583.347656, 125.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r size",
					"numinlets" : 0,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-23",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 439.868469, 538.347656, 41.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "scale 0. 1. 0. 8.",
					"numinlets" : 6,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-71",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 298.868469, 466.347656, 124.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 7",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-65",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 170.868469, 367.590332, 32.0, 24.0 ],
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-95",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 284.078674, 368.115845, 34.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-96",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 392.078674, 345.115845, 34.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-97",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 247.078674, 369.115845, 34.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "100",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-32",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 117.078674, 369.115845, 35.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-31",
					"outlettype" : [ "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 170.078674, 302.115845, 96.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-99",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 180.868469, 523.347656, 48.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-100",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 46.868469, 548.347656, 51.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Modulation",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-105",
					"fontsize" : 14.0,
					"patching_rect" : [ 349.868469, 563.347656, 85.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Harmonicity",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-106",
					"fontsize" : 14.0,
					"patching_rect" : [ 209.868469, 558.347656, 93.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Carrier Freq.",
					"linecount" : 2,
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-107",
					"fontsize" : 14.0,
					"patching_rect" : [ 107.868469, 590.347656, 50.0, 42.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Amplitude Envelope",
					"linecount" : 2,
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-9",
					"fontsize" : 14.0,
					"patching_rect" : [ 500.868408, 526.347656, 70.0, 42.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sig~",
					"linecount" : 2,
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-14",
					"outlettype" : [ "signal" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 236.868469, 593.347656, 25.0, 42.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sig~",
					"linecount" : 2,
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-15",
					"outlettype" : [ "signal" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 152.868469, 593.347656, 25.0, 42.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "line~",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-111",
					"outlettype" : [ "signal", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 284.868469, 640.347656, 56.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-112",
					"outlettype" : [ "signal" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 157.868469, 670.347656, 142.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "simpleFM~",
					"numinlets" : 3,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-20",
					"outlettype" : [ "signal" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 152.868469, 636.347656, 152.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-48",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 69.0, 39.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "next",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-153",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 55.0, 65.0, 37.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "range 0. 1.",
					"numinlets" : 2,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 1,
					"id" : "obj-137",
					"outlettype" : [ "" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 164.0, 68.0, 70.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-140",
					"triscale" : 0.9,
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 32.0, 222.0, 50.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 2,
					"id" : "obj-141",
					"outlettype" : [ "float", "bang" ],
					"fontsize" : 14.0,
					"patching_rect" : [ 105.0, 67.0, 54.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-142",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 254.0, 199.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-42",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ -4.0, 73.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "function",
					"numinlets" : 1,
					"pointcolor" : [ 0.6, 0.4, 0.6, 1.0 ],
					"numoutlets" : 4,
					"id" : "obj-43",
					"outlettype" : [ "float", "", "", "bang" ],
					"patching_rect" : [ 33.0, 113.0, 209.0, 98.0 ],
					"linecolor" : [ 0.333333, 0.333333, 0.333333, 1.0 ],
					"addpoints" : [ 0.0, 0.0, 0, 497.461914, 0.972603, 2, 1000.0, 0.0, 0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "line format output",
					"linecount" : 3,
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-50",
					"fontsize" : 14.0,
					"patching_rect" : [ 108.0, 246.0, 48.0, 60.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "interpolated y value",
					"linecount" : 2,
					"numinlets" : 1,
					"fontname" : "Adobe Garamond Pro",
					"numoutlets" : 0,
					"id" : "obj-52",
					"fontsize" : 14.0,
					"patching_rect" : [ 29.0, 251.0, 67.0, 42.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-99", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [ 190.368469, 594.0, 231.0, 594.0, 231.0, 588.0, 246.368469, 588.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-98", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 727.5, 248.0, 715.0, 248.0, 715.0, 263.0, 667.0, 263.0, 667.0, 110.0, 772.0, 110.0, 772.0, 140.0, 814.0, 140.0, 814.0, 185.0, 826.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-97", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [ 256.578674, 414.0, 303.0, 414.0, 303.0, 462.0, 282.0, 462.0, 282.0, 543.0, 228.0, 543.0, 228.0, 555.0, 195.0, 555.0, 195.0, 594.0, 231.0, 594.0, 231.0, 588.0, 246.368469, 588.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-96", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [ 401.578674, 384.0, 405.0, 384.0, 405.0, 432.0, 320.368469, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-96", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 401.578674, 384.0, 432.0, 384.0, 432.0, 510.0, 408.368408, 510.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-95", 0 ],
					"destination" : [ "obj-111", 0 ],
					"hidden" : 0,
					"midpoints" : [ 293.578674, 414.0, 303.0, 414.0, 303.0, 462.0, 282.0, 462.0, 282.0, 543.0, 228.0, 543.0, 228.0, 555.0, 195.0, 555.0, 195.0, 594.0, 231.0, 594.0, 231.0, 588.0, 273.0, 588.0, 273.0, 621.0, 294.368469, 621.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-98", 0 ],
					"hidden" : 1,
					"midpoints" : [ 705.5, 245.0, 715.0, 245.0, 715.0, 221.0, 727.5, 221.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-89", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 727.5, 269.0, 715.0, 269.0, 715.0, 263.0, 667.0, 263.0, 667.0, 110.0, 772.0, 110.0, 772.0, 140.0, 814.0, 140.0, 814.0, 185.0, 826.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 0 ],
					"destination" : [ "obj-89", 0 ],
					"hidden" : 1,
					"midpoints" : [ 705.5, 263.0, 715.0, 263.0, 715.0, 242.0, 727.5, 242.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-86", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 727.5, 230.0, 715.0, 230.0, 715.0, 263.0, 667.0, 263.0, 667.0, 110.0, 772.0, 110.0, 772.0, 140.0, 814.0, 140.0, 814.0, 185.0, 826.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 1,
					"midpoints" : [ 705.5, 227.0, 715.0, 227.0, 715.0, 203.0, 727.5, 203.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 727.5, 191.0, 715.0, 191.0, 715.0, 263.0, 667.0, 263.0, 667.0, 110.0, 772.0, 110.0, 772.0, 140.0, 814.0, 140.0, 814.0, 185.0, 826.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-84", 0 ],
					"hidden" : 1,
					"midpoints" : [ 705.5, 188.0, 715.0, 188.0, 715.0, 164.0, 727.5, 164.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [ 128.5, 27.0, 78.5, 27.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [ 320.368469, 459.0, 308.368469, 459.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 815.5, 185.0, 826.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-77", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 1,
					"midpoints" : [ 795.5, 137.0, 772.0, 137.0, 772.0, 83.0, 815.5, 83.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-76", 0 ],
					"destination" : [ "obj-189", 0 ],
					"hidden" : 0,
					"midpoints" : [ 62.368469, 459.0, 54.368469, 459.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-76", 0 ],
					"destination" : [ "obj-185", 0 ],
					"hidden" : 0,
					"midpoints" : [ 62.368469, 459.0, 120.701782, 459.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-187", 0 ],
					"hidden" : 0,
					"midpoints" : [ 53.368469, 546.0, 30.0, 546.0, 30.0, 612.0, 45.0, 612.0, 45.0, 624.0, 48.701782, 624.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-100", 0 ],
					"hidden" : 0,
					"midpoints" : [ 53.368469, 546.0, 56.368469, 546.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 310.368469, 528.0, 311.368469, 528.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [ 436.368469, 639.0, 437.368469, 639.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [ 308.368469, 501.0, 310.368469, 501.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [ 180.368469, 393.0, 189.0, 393.0, 189.0, 423.0, 194.368469, 423.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 1 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-4", 1 ],
					"hidden" : 0,
					"midpoints" : [ 437.368469, 666.0, 351.0, 666.0, 351.0, 705.0, 288.368469, 705.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 437.368469, 657.0, 439.863037, 657.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-160", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1146.5, 158.0, 1132.5, 158.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-20", 2 ],
					"hidden" : 0,
					"midpoints" : [ 312.368469, 603.0, 295.368469, 603.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [ 507.701782, 393.0, 508.5, 393.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1148.5, 131.0, 1146.5, 131.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-153", 0 ],
					"hidden" : 0,
					"midpoints" : [ 78.5, 57.0, 64.5, 57.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [ 411.701782, 145.0, 412.5, 145.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-61", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-19", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 1 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 2 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 3 ],
					"destination" : [ "obj-142", 0 ],
					"hidden" : 0,
					"midpoints" : [ 232.5, 213.0, 249.0, 213.0, 249.0, 195.0, 263.5, 195.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-140", 0 ],
					"hidden" : 0,
					"midpoints" : [ 42.5, 219.0, 41.5, 219.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 1 ],
					"destination" : [ "obj-111", 0 ],
					"hidden" : 0,
					"midpoints" : [ 105.833336, 615.0, 294.368469, 615.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 5.5, 108.0, 42.5, 108.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-62", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 1 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [ 165.368469, 744.0, 501.0, 744.0, 501.0, 639.0, 513.0, 639.0, 513.0, 627.0, 530.567871, 627.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-157", 0 ],
					"hidden" : 0,
					"midpoints" : [ 165.368469, 744.0, 501.0, 744.0, 501.0, 639.0, 513.0, 639.0, 513.0, 618.0, 711.0, 618.0, 711.0, 372.0, 733.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 1 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-61", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-62", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 126.578674, 393.0, 105.0, 393.0, 105.0, 381.0, 30.0, 381.0, 30.0, 585.0, 162.368469, 585.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-97", 0 ],
					"hidden" : 0,
					"midpoints" : [ 179.578674, 354.0, 256.578674, 354.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-96", 0 ],
					"hidden" : 0,
					"midpoints" : [ 179.578674, 330.0, 401.578674, 330.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-95", 0 ],
					"hidden" : 0,
					"midpoints" : [ 179.578674, 354.0, 293.578674, 354.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-31", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [ 179.578674, 336.0, 126.578674, 336.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [ 436.368469, 609.0, 436.368469, 609.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 408.368408, 565.847656, 436.368469, 565.847656 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 449.368469, 579.0, 436.368469, 579.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-156", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [ 311.368469, 567.0, 312.368469, 567.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-112", 0 ],
					"hidden" : 0,
					"midpoints" : [ 162.368469, 666.0, 167.368469, 666.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-190", 0 ],
					"destination" : [ "obj-191", 0 ],
					"hidden" : 0,
					"midpoints" : [ 100.701782, 546.0, 101.5, 546.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-189", 0 ],
					"destination" : [ "obj-186", 0 ],
					"hidden" : 0,
					"midpoints" : [ 54.368469, 489.0, 53.368469, 489.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-187", 0 ],
					"destination" : [ "obj-188", 0 ],
					"hidden" : 0,
					"midpoints" : [ 48.701782, 651.0, 49.5, 651.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-186", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [ 53.368469, 516.0, 53.368469, 516.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-186", 0 ],
					"destination" : [ "obj-190", 0 ],
					"hidden" : 0,
					"midpoints" : [ 53.368469, 516.0, 100.701782, 516.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-185", 0 ],
					"destination" : [ "obj-184", 0 ],
					"hidden" : 0,
					"midpoints" : [ 120.701782, 480.0, 189.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-183", 0 ],
					"destination" : [ "obj-163", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1032.5, 92.0, 1009.0, 92.0, 1009.0, 167.0, 1030.5, 167.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-172", 0 ],
					"destination" : [ "obj-156", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 0 ],
					"destination" : [ "obj-157", 1 ],
					"hidden" : 0,
					"midpoints" : [ 826.5, 362.0, 746.900024, 362.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 1 ],
					"destination" : [ "obj-139", 0 ],
					"hidden" : 0,
					"midpoints" : [ 874.166687, 332.0, 874.166626, 332.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 2 ],
					"destination" : [ "obj-136", 0 ],
					"hidden" : 0,
					"midpoints" : [ 921.833313, 332.0, 921.833374, 332.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 3 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [ 969.5, 332.0, 969.5, 332.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-169", 4 ],
					"destination" : [ "obj-126", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1017.166687, 332.0, 1017.166626, 332.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-168", 0 ],
					"destination" : [ "obj-35", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-167", 0 ],
					"destination" : [ "obj-168", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-166", 0 ],
					"destination" : [ "obj-165", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-165", 0 ],
					"destination" : [ "obj-24", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-165", 0 ],
					"destination" : [ "obj-168", 1 ],
					"hidden" : 0,
					"midpoints" : [ 995.5, 740.0, 955.0, 740.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-164", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 704.5, 293.0, 682.0, 293.0, 682.0, 341.0, 802.0, 341.0, 802.0, 269.0, 814.0, 269.0, 814.0, 197.0, 826.5, 197.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-163", 0 ],
					"destination" : [ "obj-169", 5 ],
					"hidden" : 0,
					"midpoints" : [ 1030.5, 197.0, 1030.785767, 197.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-162", 0 ],
					"destination" : [ "obj-169", 6 ],
					"hidden" : 0,
					"midpoints" : [ 1081.5, 197.0, 1071.642822, 197.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-161", 0 ],
					"destination" : [ "obj-166", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1053.5, 683.0, 995.5, 683.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-160", 0 ],
					"destination" : [ "obj-169", 7 ],
					"hidden" : 0,
					"midpoints" : [ 1132.5, 197.0, 1112.5, 197.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [ 323.5, 432.0, 320.368469, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-158", 0 ],
					"destination" : [ "obj-166", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-157", 0 ],
					"destination" : [ "obj-150", 0 ],
					"hidden" : 0,
					"midpoints" : [ 733.5, 401.0, 745.5, 401.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-156", 1 ],
					"destination" : [ "obj-161", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-156", 0 ],
					"destination" : [ "obj-158", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-153", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 64.5, 99.0, 42.5, 99.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-150", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 745.5, 562.0, 867.5, 562.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-150", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-150", 0 ],
					"destination" : [ "obj-180", 0 ],
					"hidden" : 0,
					"midpoints" : [ 745.5, 441.0, 822.0, 441.0, 822.0, 420.0, 836.567871, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 162.368469, 636.0, 162.368469, 636.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-149", 0 ],
					"destination" : [ "obj-157", 0 ],
					"hidden" : 0,
					"midpoints" : [ 689.5, 368.0, 733.5, 368.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-141", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 114.5, 93.0, 90.0, 93.0, 90.0, 99.0, 42.5, 99.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-20", 1 ],
					"hidden" : 0,
					"midpoints" : [ 246.368469, 636.0, 231.0, 636.0, 231.0, 633.0, 228.868469, 633.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-137", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 1,
					"midpoints" : [ 173.5, 90.0, 159.0, 90.0, 159.0, 99.0, 42.5, 99.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-117", 1 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 0,
					"midpoints" : [ 767.0, 170.0, 796.0, 170.0, 796.0, 185.0, 826.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-116", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 815.5, 185.0, 826.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-115", 0 ],
					"destination" : [ "obj-116", 0 ],
					"hidden" : 1,
					"midpoints" : [ 795.5, 116.0, 772.0, 116.0, 772.0, 83.0, 815.5, 83.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-90", 0 ],
					"hidden" : 1,
					"midpoints" : [ 680.5, 221.0, 705.5, 221.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-88", 0 ],
					"hidden" : 1,
					"midpoints" : [ 680.5, 242.0, 705.5, 242.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 1,
					"midpoints" : [ 680.5, 167.0, 705.5, 167.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-117", 0 ],
					"hidden" : 1,
					"midpoints" : [ 680.5, 79.0, 667.0, 79.0, 667.0, 110.0, 741.5, 110.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-108", 0 ],
					"hidden" : 1,
					"midpoints" : [ 680.5, 185.0, 705.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-113", 0 ],
					"destination" : [ "obj-114", 0 ],
					"hidden" : 1,
					"midpoints" : [ 687.5, 149.0, 680.5, 149.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 167.368469, 696.0, 165.368469, 696.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-111", 0 ],
					"destination" : [ "obj-112", 1 ],
					"hidden" : 0,
					"midpoints" : [ 294.368469, 666.0, 290.368469, 666.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-110", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 727.5, 212.0, 715.0, 212.0, 715.0, 263.0, 667.0, 263.0, 667.0, 110.0, 772.0, 110.0, 772.0, 140.0, 814.0, 140.0, 814.0, 185.0, 826.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-99", 0 ],
					"hidden" : 0,
					"midpoints" : [ 194.368469, 519.0, 190.368469, 519.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-108", 0 ],
					"destination" : [ "obj-110", 0 ],
					"hidden" : 1,
					"midpoints" : [ 705.5, 206.0, 715.0, 206.0, 715.0, 185.0, 727.5, 185.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-104", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 704.5, 311.0, 691.0, 311.0, 691.0, 341.0, 802.0, 341.0, 802.0, 269.0, 814.0, 269.0, 814.0, 197.0, 826.5, 197.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-169", 0 ],
					"hidden" : 1,
					"midpoints" : [ 704.5, 332.0, 802.0, 332.0, 802.0, 269.0, 814.0, 269.0, 814.0, 197.0, 826.5, 197.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-100", 0 ],
					"destination" : [ "obj-182", 0 ],
					"hidden" : 0,
					"midpoints" : [ 56.368469, 594.0, 58.5, 594.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-100", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 56.368469, 585.0, 162.368469, 585.0 ]
				}

			}
 ]
	}

}
