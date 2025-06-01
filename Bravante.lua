-- 📱 DELTA SAFE SIMULATOR
-- Versão corrigida para Lua padrão

local Delta = {}
Delta.__index = Delta

function Delta:new()
    local self = setmetatable({}, Delta)
    self.ativo = false
    self.alvos = {"Player1", "Player2", "Player3", "Target1", "Enemy1"}
    self.posicao = {x = 0, y = 0, z = 0}
    self.hp = 100
    return self
end

function Delta:logo()
    print("\n🔺 === DELTA SAFE SIMULATOR ===")
    print("📱 Versão Mobile Simulada")
    print("🛡️  Proteção Anti-Kick: ATIVA")
    print("🎯 Auto Kill: " .. (self.ativo and "🟢 ON" or "🔴 OFF"))
    print("❤️  HP: " .. self.hp)
    print("===============================")
end

function Delta:menu()
    print("\n🎮 OPÇÕES:")
    print("1. 🎯 Toggle Auto Kill")
    print("2. 📊 Status do Sistema") 
    print("3. 👥 Lista de Alvos")
    print("4. 🏃 Teleporte Rápido")
    print("5. 🛡️  Teste Anti-Kick")
    print("0. ❌ Sair")
    io.write("\n➤ Escolha: ")
    io.flush()
end

function Delta:toggleAutoKill()
    self.ativo = not self.ativo
    local status = self.ativo and "ATIVADO" or "DESATIVADO"
    print("\n🎯 Auto Kill " .. status .. "!")
    
    if self.ativo then
        print("⚡ Iniciando caça aos alvos...")
        self:executarAutoKill()
    else
        print("⏹️  Sistema pausado")
    end
end

function Delta:sleep(seconds)
    local start = os.clock()
    while os.clock() - start < seconds do end
end

function Delta:executarAutoKill()
    if not self.ativo then return end
    
    print("\n🔍 Escaneando área...")
    for i, alvo in ipairs(self.alvos) do
        if self.ativo then
            print("🎯 Alvistando: " .. alvo)
            self:moverPara(i * 15, i * 10, 5)
            
            local dano = math.random(20, 45)
            print("⚔️  Atacando " .. alvo .. " | Dano: " .. dano)
            print("💥 " .. alvo .. " eliminado!")
            
            -- Pausa entre ataques
            self:sleep(0.5)
        else
            break
        end
    end
    
    if self.ativo then
        print("✅ Todos os alvos eliminados!")
        print("🏆 Vitória conquistada!")
    end
end

function Delta:moverPara(x, y, z)
    self.posicao.x = x
    self.posicao.y = y
    self.posicao.z = z
    print("🚶 Teleportando para: (" .. x .. ", " .. y .. ", " .. z .. ")")
end

function Delta:mostrarStatus()
    print("\n📊 === STATUS DELTA ===")
    print("🎯 Auto Kill: " .. (self.ativo and "🟢 ATIVO" or "🔴 INATIVO"))
    print("📍 Posição: (" .. self.posicao.x .. ", " .. self.posicao.y .. ", " .. self.posicao.z .. ")")
    print("👥 Alvos: " .. #self.alvos .. " disponíveis")
    print("❤️  HP: " .. self.hp .. "/100")
    print("🛡️  Proteção: ATIVA")
    print("====================")
end

function Delta:listarAlvos()
    print("\n👥 === ALVOS DETECTADOS ===")
    for i, alvo in ipairs(self.alvos) do
        local dist = math.random(10, 100)
        local status = math.random() > 0.3 and "🟢 Vivo" or "💀 Morto"
        print(i .. ". " .. alvo .. " - " .. status .. " | Dist: " .. dist .. "m")
    end
    print("=========================")
end

function Delta:teleporteRapido()
    print("\n🏃 === TELEPORTE RÁPIDO ===")
    print("1. 🏠 Spawn")
    print("2. ⚔️  Arena PvP")  
    print("3. 💎 Loja")
    print("4. 🌊 Oceano")
    io.write("➤ Destino: ")
    io.flush()
    local input = io.read()
    local dest = tonumber(input)
    
    if dest == 1 then 
        self:moverPara(0, 0, 0)
        print("🏠 Teleportado para Spawn!")
    elseif dest == 2 then 
        self:moverPara(100, 50, 0)
        print("⚔️  Teleportado para Arena PvP!")
    elseif dest == 3 then 
        self:moverPara(-50, 0, 20)
        print("💎 Teleportado para Loja!")
    elseif dest == 4 then 
        self:moverPara(200, -10, 100)
        print("🌊 Teleportado para Oceano!")
    else 
        print("❌ Destino inválido!")
    end
end

function Delta:testeAntiKick()
    print("\n🛡️  Testando proteção Anti-Kick...")
    print("⚠️  Simulando tentativa de kick...")
    self:sleep(1)
    print("🔄 Interceptando comando...")
    self:sleep(1)
    print("✅ Kick bloqueado com sucesso!")
    print("🛡️  Delta Safe funcionando!")
end

-- 🎮 Sistema principal
math.randomseed(os.time())
local delta = Delta:new()

print("🔺 DELTA SAFE CARREGADO!")
print("📱 Simulador para Mobile")

while true do
    delta:logo()
    delta:menu()
    local input = io.read()
    local opcao = tonumber(input)
    
    if opcao == 1 then
        delta:toggleAutoKill()
    elseif opcao == 2 then
        delta:mostrarStatus()
    elseif opcao == 3 then
        delta:listarAlvos()
    elseif opcao == 4 then
        delta:teleporteRapido()
    elseif opcao == 5 then
        delta:testeAntiKick()
    elseif opcao == 0 then
        print("👋 Delta Safe desativado!")
        break
    else
        print("❌ Opção inválida!")
    end
    
    print("\n⏸️  Pressione Enter para continuar...")
    io.read()
end
