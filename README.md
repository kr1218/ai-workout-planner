# Garmin AI Workout Planner

## Backend Deployment

1. Opprett Railway.io-konto.
2. Importer backend-prosjektet.
3. Legg inn din OpenAI API-nøkkel som miljøvariabel: `OPENAI_API_KEY`.
4. Deploy!

## Garmin SDK

1. Installer Garmin Monkey C SDK: https://developer.garmin.com/connect-iq/sdk/
2. Last opp app-koden.
3. Test i simulator.
4. Legg inn Railway backend-URL i koden før bygging.

## Testing

- Treningsplanen genereres av OpenAI GPT-4o.
- Garmin-klienten kaller backend og viser planen.

## Fremtidig arbeid

- Brukerinput på klokka (interaktiv)
- Paging av lange treningsplaner
- Komplette settings og brukervalg

