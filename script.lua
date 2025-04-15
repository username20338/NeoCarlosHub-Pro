--// NeoCarlosHub Pro com Sistema de Key | Chave: Key systemy 🔐

local expectedKey = "Key systemy"  -- Chave atualizada
local inputKey = ""  -- Aqui o jogador deve inserir a chave manualmente no console

local isDarkMode = false  -- Modo claro ou escuro
local fpsBoost = false  -- FPS Boost ativado ou não

-- Função para verificar a chave
local function checkKey()
    print("Por favor, insira a chave de acesso para o 'Key systemy':")  -- Mensagem com o nome da chave
    inputKey = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ScreenGui"):FindFirstChild("TextBox"):Text
    if inputKey == expectedKey then
        -- A chave está correta, liberar o NeoCarlosHub
        print("Chave correta! Acesso liberado ao 'Key systemy'.")
        -- Continue com a execução normal do NeoCarlosHub
        setupGUI()
    else
        -- Chave incorreta, bloquear o acesso
        print("Chave incorreta! Acesso negado ao 'Key systemy'.")
        game:GetService("Players").LocalPlayer:Kick("A chave de acesso está incorreta. Feche o jogo e insira a chave correta do 'Key systemy'.")
    end
end

-- Função para configurar a interface de usuário
local function setupGUI()
    -- Adicionando botões para modo claro/escuro
    local gui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
    local button = Instance.new("TextButton")
    button.Parent = gui
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0, 100, 0, 100)
    button.Text = "Alternar Modo (Claro/Escuro)"
    button.MouseButton1Click:Connect(function()
        isDarkMode = not isDarkMode
        if isDarkMode then
            gui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            gui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
        end
    end)

    -- FPS Boost (simulação)
    if fpsBoost then
        game:GetService("UserSettings").GameSettings:SetSetting("PerformanceStatsEnabled", true)
        print("FPS Boost ativado!")
    end

    -- Reset da GUI
    local resetButton = Instance.new("TextButton")
    resetButton.Parent = gui
    resetButton.Size = UDim2.new(0, 200, 0, 50)
    resetButton.Position = UDim2.new(0, 100, 0, 160)
    resetButton.Text = "Resetar GUI"
    resetButton.MouseButton1Click:Connect(function()
        gui:ClearAllChildren()
        setupGUI()
    end)
end

-- Iniciar a verificação
checkKey()
