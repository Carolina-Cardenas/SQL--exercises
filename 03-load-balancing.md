# Övning 3 – Lastbalansering och SQL Server

## 1. Vad är lastbalansering?

Lastbalansering innebär att fördela inkommande förfrågningar mellan flera servrar. En lastbalanserare tar emot varje förfrågan och väljer vilken server som ska hantera den.

## 2. När kan man använda lastbalansering?

Ett exempel är min bokningssida för en psykolog. Om många besökare vill se lediga tider samtidigt kan en lastbalanserare fördela deras förfrågningar mellan flera servrar som kör samma webbplats.

## 3. Vilka är tre fördelar med lastbalansering?

1. Risken för överbelastning minskar eftersom flera servrar delar på arbetet.
2. Om en server slutar fungera kan nya förfrågningar skickas till de servrar som fortfarande fungerar.
3. Om webbplatsen får fler besökare går det att lägga till fler servrar för att hantera trafiken.

## 4. Vad är SQL Server Replication?

Det används för att kopiera data mellan databaser och föra över ändringar. Ett företag kan till exempel kopiera försäljningsdata till en annan databas för att skapa rapporter där.

## 5. Vad är Database Mirroring?

Database Mirroring innebär att en databas har en spegelkopia på en annan SQL Server-instans. Ändringar från huvuddatabasen förs över till kopian. Om huvuddatabasen slutar fungera kan kopian ta över, beroende på hur det är konfigurerat.

## 6. Vad är Always On Availability Groups?

Med Always On Availability Groups kan man samla flera databaser i en grupp. En primär SQL Server-instans hanterar databaserna och andra instanser håller kopior uppdaterade. Om den primära instansen slutar fungera kan en annan instans ta över hela gruppen.
