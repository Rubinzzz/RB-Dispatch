Config = {}

Config.Locale = 'cs'  -- Nastavení jazyka

RB.Dispatch = {
    PoliceJob = 'police',  -- Název policejní práce v ESX
    BlipTime = 10 ,  -- Doba v sekundách, po kterou bude blip viditelný na mapě
    BlipRadius = 50.0,  -- Poloměr blipu
    BlipColor = 1,  -- Barva blipu (1 = červená)
    BlipSprite = 161,  -- Ikona blipu (161 = červený kruh)
    AlertMessage = 'PD Dispatch: ',  -- Zpráva, která se zobrazí při odeslání upozornění
}

return Config