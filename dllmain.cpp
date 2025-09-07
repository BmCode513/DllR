// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"
#include <windows.h>

extern "C" __declspec(dllexport) HICON LoadMyIcon(int iconID)
{
    return LoadIcon(GetModuleHandle(L"DllR.dll"), MAKEINTRESOURCE(iconID));
}

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

