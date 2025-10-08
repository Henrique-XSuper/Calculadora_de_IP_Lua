local function ip_to_integer(ip_str)
    local integer_ip = 0
    local octets = {}
    for octet in string.gmatch(ip_str, "([0-9]+)") do
        table.insert(octets, tonumber(octet))
    end
    integer_ip = octets[1] * 256^3 + octets[2] * 256^2 + octets[3] * 256 + octets[4]
    return integer_ip
end


local function integer_to_ip(integer_ip)
    local octets = {}
    local ip_rest = integer_ip
    octets[1] = math.floor(ip_rest / 256^3)
    ip_rest = ip_rest % 256^3
    octets[2] = math.floor(ip_rest / 256^2)
    ip_rest = ip_rest % 256^2
    octets[3] = math.floor(ip_rest / 256)
    octets[4] = ip_rest % 256
    return table.concat(octets, ".")
end


local function escolher_classe()
    print("Escolha a classe da rede (A, B, C, D):")
    local classe = io.read():upper()

    if classe == "A" then
        print("Classe A selecionada. Faixa típica: 0.0.0.0 - 127.255.255.255")
    elseif classe == "B" then
        print("Classe B selecionada. Faixa típica: 128.0.0.0 - 191.255.255.255")
    elseif classe == "C" then
        print("Classe C selecionada. Faixa típica: 192.0.0.0 - 223.255.255.255")
    elseif classe == "D" then
        print("Classe D selecionada (multicast, sem hosts utilizáveis).")
    else
        print("Classe inválida, prosseguindo como Classe C por padrão.")
        classe = "C"
    end

    return classe
end


local function validar_ip(ip)
    local partes = {}
    for oct in string.gmatch(ip, "(%d+)") do
        table.insert(partes, tonumber(oct))
    end
    if #partes ~= 4 then return false end
    for _, n in ipairs(partes) do
        if n < 0 or n > 255 then
            return false
        end
    end
    return true
end


local function calcular_subrede()
    local classe = escolher_classe()

    print("\nDigite o endereço IP (ex: 192.168.1.1):")
    local ip_str = io.read()

    if not validar_ip(ip_str) then
        print("Endereço IP inválido. Tente novamente.")
        return
    end

    print("Digite a barra CIDR (ex: 24):")
    local cidr = tonumber(io.read())

    if not cidr or cidr < 0 or cidr > 32 then
        print("CIDR inválido. Tente novamente.")
        return
    end

    -- Conversões
    local ip_integer = ip_to_integer(ip_str)

    -- Máscara de sub-rede
    local mascara_inteira = (2^cidr - 1) * 2^(32 - cidr)
    local mascara_str = integer_to_ip(mascara_inteira)

    -- Endereço de rede
    local rede_inteira = bit32.band(ip_integer, mascara_inteira)
    local rede_str = integer_to_ip(rede_inteira)

    -- Endereço de broadcast
    local mascara_invertida = bit32.bnot(mascara_inteira)
    local broadcast_inteiro = bit32.bor(rede_inteira, mascara_invertida)
    local broadcast_str = integer_to_ip(broadcast_inteiro)

    -- Total de hosts
    local total_hosts = 2^(32 - cidr)
    local hosts_utilizaveis = (cidr == 31 or cidr == 32) and 0 or total_hosts - 2

    
    print("\n------------------------------")
    print("ANÁLISE DE SUB-REDE")
    print("------------------------------")
    print("Classe:                " .. classe)
    print("Endereço IP:           " .. ip_str)
    print("Barra CIDR:            /" .. cidr)
    print("Máscara de rede:       " .. mascara_str)
    print("Endereço de Rede:      " .. rede_str)
    print("Endereço de Broadcast: " .. broadcast_str)
    print("Total de hosts:        " .. total_hosts)
    print("Hosts utilizáveis:     " .. hosts_utilizaveis)
    print("------------------------------")
end


calcular_subrede()
