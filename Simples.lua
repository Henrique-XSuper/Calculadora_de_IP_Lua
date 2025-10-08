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


local function calcular_subrede()
    
    print("Digite o endereco IP (ex: 192.168.1.1):")
    local ip_str = io.read()
    
    print("Digite a barra CIDR (ex: 24):")
    local cidr_str = io.read()
    local cidr = tonumber(cidr_str)
    
    
    if not ip_str or not cidr or cidr < 0 or cidr > 32 then
        print("Entrada invalida. Por favor, tente novamente.")
        return
    end
    
    
    local ip_integer = ip_to_integer(ip_str)
    
    
    local mascara_inteira = (2^cidr - 1) * 2^(32 - cidr)
    local mascara_str = integer_to_ip(mascara_inteira)
    
    
    local rede_inteira = bit32.band(ip_integer, mascara_inteira)
    local rede_str = integer_to_ip(rede_inteira)
    
    
    local mascara_invertida = bit32.bnot(mascara_inteira)
    local broadcast_inteiro = bit32.bor(rede_inteira, mascara_invertida)
    local broadcast_str = integer_to_ip(broadcast_inteiro)
    
    -- Total de hosts
    local total_hosts = 2^(32 - cidr)
    
    -- Total de hosts utilizáveis
    local hosts_utilizaveis = total_hosts - 2
    
    
    print("\n------------------------------")
    print("ANALISE DE SUB-REDE")
    print("------------------------------")
    print("Endereco IP:            " .. ip_str)
    print("Barra CIDR:             /" .. cidr)
    print("Mascara de rede:        " .. mascara_str)
    print("Endereco de Rede:       " .. rede_str)
    print("Endereco de Broadcast:  " .. broadcast_str)
    print("Total de hosts:         " .. total_hosts)
    print("Hosts utilizaveis:      " .. hosts_utilizaveis)
    print("------------------------------")
end


calcular_subrede()

