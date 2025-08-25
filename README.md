# Google Takeout Date Fixer # ENGLISH

This PowerShell script updates the creation dates of your photos and videos exported from Google Takeout. 
It reads metadata from Google JSON files and sets the EXIF/Media dates correctly. It also cleans up the JSON files after use.

## Requirements
- Windows 10/11
- [ExifTool](https://exiftool.org/) downloaded and placed in  `C:\Tools\exiftool.exe`.
 after download change name with 'exiftool(-K).exe' on 'exiftool.exe'
- PowerShell 5+ (included in Windows)

## Usage
1. Extract your Google Takeout archive to a folder. **It must be fully extracted, not a zip.**
2. Run `run_update.bat` (or execute `update_dates.ps1` directly in PowerShell).
3. When prompted, enter the **full path to your extracted Takeout folder** (e.g., `H:\Google Photos\Takeout`).
4. The script will scan all supported files (`.heic, .jpg, .jpeg, .png, .mp4, .mov, .avi`), update missing dates from JSON, and remove JSON files.
5. Check `migration_log.txt` in the same folder for details.

## Features
- Reads `photoTakenTime` from JSON for files missing dates. 
- Updates EXIF/Media dates for images and videos.
- Deletes JSON files after processing.
- Logs all actions and provides summary at the end.

## Notes
- Some photos taken in burst mode may have identical timestamps (Google Takeout limitation).
- The script processes files recursively in all subfolders.




# Google Takeout Date Fixer # POLISH

-Ten skrypt programu PowerShell aktualizuje daty utworzenia zdjęć i filmów wyeksportowanych z Google Takeout.
Odczytuje metadane z plików Google JSON i poprawnie ustawia daty EXIF/Media. Czyści również pliki JSON po użyciu.
-Miałem prolem podczas exportu zdjęć i filmów do NextCloud'a, gdyż w połowie brakowało dat - ten skrypt werfikuje gdzie data jest gdzie jej nie ma. sprawdza zdjęcie po zdjęciu i usuwa .json'y powstałe z archiwum od Google TakeOut

# Wymagania
- Windows 10/11
- [ExifTool](https://exiftool.org/) pobrany i umieszczony w `C:\Tools\exiftool.exe`.
Po pobraniu zmień nazwę pliku `exiftool.exe` na `exiftool(-K).exe`
- PowerShell 5+ (dołączony do systemu Windows)

## Sposób użycia
1. Wypakuj archiwum Google Takeout  ze zdjęciami do folderu. **Musi być w pełni rozpakowane, a nie w formacie zip.**
2. Uruchom `run_update.bat` (lub uruchom `update_dates.ps1` bezpośrednio w programie PowerShell).
3. Po wyświetleniu monitu wprowadź **pełną ścieżkę do wyodrębnionego folderu Takeout** (np. `H:\Google Photos\Takeout`).
4. Skrypt przeskanuje wszystkie obsługiwane pliki (`.heic, .jpg, .jpeg, .png, .mp4, .mov, .avi`), zaktualizuje brakujące daty w JSON i usunie pliki JSON.
5. Sprawdź plik `migration_log.txt` w tym samym folderze, aby uzyskać szczegółowe informacje .

## Funkcje
- Odczytuje `photoTakenTime` z JSON w celu znalezienia brakujących dat plików.
- Aktualizuje daty EXIF/Media dla zdjęć i filmów.
- Usuwa pliki JSON po przetworzeniu.
- Rejestruje i pokazuje wszystkie działania i wyświetla podsumowanie na końcu.

## Uwagi
- Niektóre zdjęcia wykonane w trybie seryjnym mogą mieć identyczne znaczniki czasu (ograniczenie Google Takeout - tak jest w .json).
- Skrypt przetwarza pliki rekurencyjnie we wszystkich podfolderach wskazanym przez uzytkownika miejscu.








Pozdrawiam i życze wszystkiego dobrego na nowej chmurze.
