project "Examples"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**.h",
        "src/**.cpp"
    }

    includedirs
    {
        "%{wks.location}/GUI-Toolkit/src",
        "src"
    }

    links
    {
        "GUI-Toolkit"
    }

    filter "system:linux"
        postbuildcommands
        {
            ("cp -R -l Res \"%{wks.location}bin/" .. outputdir .. "/%{prj.name}/Res\"")
        }

    filter "system:windows"
		systemversion "latest"

        postbuildcommands
        { 
            "Xcopy /E /I /y Res \"%{wks.location}bin\\" .. outputdir .. "\\%{prj.name}\\Res\""
        }

	filter "configurations:Debug"
		defines "DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "RELEASE"
		runtime "Release"
		optimize "on"