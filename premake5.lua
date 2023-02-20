workspace "Graphical User Interface"
    architecture "x86_64"
    configurations { "Debug", "Release" }

application = "Examples"
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "Renderer"

include "GUI-Toolkit"

include (application)