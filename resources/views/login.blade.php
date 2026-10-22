<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Portal</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-outer: #f3effa;
            --left-pane-bg: #ded3f1;
            --brand-primary: #522d86;
            --brand-primary-hover: #432371;
            --brand-heading: #49297a;
            --brand-subtext: #614d7b;
            --brand-yellow: #f8df64;
            --title-color: #232227;
            --subtitle-color: #636671;
            --segment-bg: #ece3f7;
            --segment-inactive: #6d5490;
            --input-bg: #e9e9ec;
            --input-icon: #9da1ab;
            --input-text: #2f3036;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            min-height: 100vh;
            background-color: var(--bg-outer);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
            color: var(--title-color);
            -webkit-font-smoothing: antialiased;
        }

        /* Centered Main Card Container */
        .portal-card {
            width: 100%;
            max-width: 930px;
            min-height: 575px;
            background: #ffffff;
            border-radius: 24px;
            box-shadow: 0 20px 45px -10px rgba(82, 45, 134, 0.16), 0 8px 20px -6px rgba(0, 0, 0, 0.04);
            display: flex;
            overflow: hidden;
            position: relative;
        }

        /* ---------------- LEFT PANEL ---------------- */
        .left-panel {
            flex: 0 0 49%;
            background-color: var(--left-pane-bg);
            padding: 44px 40px 0 42px;
            display: flex;
            flex-direction: column;
            position: relative;
            overflow: hidden;
        }

        /* Brand / Logo Row */
        .brand-row {
            display: flex;
            align-items: center;
            gap: 14px;
            z-index: 3;
        }

        .brand-logo {
            width: 52px;
            height: 52px;
            background: transparent;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .brand-logo img {
            width: 100%;
            height: 100%;
            display: block;
            object-fit: contain;
        }

        .brand-logo svg {
            width: 38px;
            height: 38px;
        }

        .brand-name-wrap {
            position: relative;
            display: inline-flex;
            align-items: center;
        }

        .brand-name-text {
            font-size: 2.2rem;
            font-weight: 800;
            color: #533088;
            letter-spacing: -0.025em;
            line-height: 1;
        }

        .brand-yellow-dot {
            position: absolute;
            top: 2px;
            right: -13px;
            width: 10px;
            height: 10px;
            background-color: var(--brand-yellow);
            border-radius: 50%;
        }

        /* Hero Text */
        .hero-heading {
            margin-top: 38px;
            font-size: 2.3rem;
            line-height: 1.15;
            font-weight: 800;
            color: var(--brand-heading);
            letter-spacing: -0.025em;
            z-index: 3;
        }

        .hero-desc {
            margin-top: 18px;
            font-size: 0.93rem;
            line-height: 1.55;
            color: var(--brand-subtext);
            max-width: 370px;
            font-weight: 500;
            z-index: 3;
        }

        /* Layered Wave Curves at bottom */
        .waves-wrapper {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 270px;
            pointer-events: none;
            z-index: 1;
        }

        .waves-wrapper svg {
            width: 100%;
            height: 100%;
            display: block;
        }

        /* ---------------- RIGHT PANEL ---------------- */
        .right-panel {
            flex: 0 0 51%;
            background: #ffffff;
            padding: 44px 46px 36px 46px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            z-index: 2;
        }

        .panel-heading {
            font-size: 1.7rem;
            font-weight: 800;
            color: var(--title-color);
            letter-spacing: -0.025em;
            line-height: 1.2;
        }

        .panel-sub {
            margin-top: 6px;
            font-size: 0.9rem;
            line-height: 1.45;
            color: var(--subtitle-color);
            font-weight: 500;
        }

        /* Segmented Selector for Role */
        .role-section-label {
            margin-top: 24px;
            margin-bottom: 8px;
            font-size: 0.88rem;
            font-weight: 600;
            color: #555964;
        }

        .role-segment {
            background-color: var(--segment-bg);
            border-radius: 10px;
            padding: 4px;
            display: flex;
            gap: 4px;
        }

        .role-btn {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 9px 12px;
            border: none;
            background: transparent;
            color: var(--segment-inactive);
            font-size: 0.92rem;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .role-btn svg {
            width: 17px;
            height: 17px;
            fill: currentColor;
        }

        .role-btn.active {
            background: #ffffff;
            color: var(--brand-primary);
            font-weight: 700;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        /* Inputs */
        .field-group {
            margin-top: 16px;
        }

        .field-label {
            display: block;
            font-size: 0.88rem;
            font-weight: 700;
            color: #2a2b30;
            margin-bottom: 8px;
        }

        .field-input-box {
            position: relative;
            display: flex;
            align-items: center;
            background-color: var(--input-bg);
            border-radius: 8px;
            height: 46px;
            padding: 0 14px;
            transition: box-shadow 0.2s, background-color 0.2s;
        }

        .field-input-box:focus-within {
            box-shadow: 0 0 0 2px var(--brand-primary);
            background-color: #f0f0f3;
        }

        .field-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--input-icon);
            margin-right: 12px;
            flex-shrink: 0;
        }

        .field-icon svg {
            width: 20px;
            height: 20px;
        }

        .input-element {
            width: 100%;
            height: 100%;
            border: none;
            background: transparent;
            font-size: 0.92rem;
            color: var(--input-text);
            font-weight: 500;
            outline: none;
        }

        .input-element::placeholder {
            color: #9da1ab;
            font-weight: 400;
        }

        .password-toggle-btn {
            background: none;
            border: none;
            cursor: pointer;
            color: #8d919c;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 4px;
            margin-left: 6px;
            transition: color 0.15s;
        }

        .password-toggle-btn:hover {
            color: var(--brand-primary);
        }

        .password-toggle-btn svg {
            width: 20px;
            height: 20px;
        }

        /* Remember Me Row */
        .remember-container {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 14px;
            margin-bottom: 20px;
            cursor: pointer;
            user-select: none;
        }

        .remember-checkbox {
            appearance: none;
            -webkit-appearance: none;
            width: 18px;
            height: 18px;
            background: #ffffff;
            border: 1.5px solid #b7bac2;
            border-radius: 4px;
            cursor: pointer;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.15s ease;
        }

        .remember-checkbox:checked {
            background: var(--brand-primary);
            border-color: var(--brand-primary);
        }

        .remember-checkbox:checked::after {
            content: "";
            width: 5px;
            height: 9px;
            border: solid white;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
            position: absolute;
            top: 2px;
        }

        .remember-text {
            font-size: 0.86rem;
            color: #444750;
            font-weight: 500;
        }

        /* Submit Button */
        .login-submit-btn {
            width: 100%;
            height: 48px;
            background-color: var(--brand-primary);
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 0.95rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            cursor: pointer;
            box-shadow: 0 4px 14px rgba(82, 45, 134, 0.28);
            transition: background-color 0.2s ease, transform 0.1s ease, box-shadow 0.2s ease;
        }

        .login-submit-btn:hover {
            background-color: var(--brand-primary-hover);
            box-shadow: 0 6px 18px rgba(82, 45, 134, 0.36);
        }

        .login-submit-btn:active {
            transform: scale(0.99);
        }

        .login-submit-btn svg {
            width: 20px;
            height: 20px;
        }

        /* Forgot Password */
        .forgot-pass-wrap {
            margin-top: 14px;
            text-align: right;
        }

        .forgot-pass-link {
            font-size: 0.86rem;
            font-weight: 700;
            color: var(--brand-primary);
            text-decoration: underline;
            transition: color 0.15s;
        }

        .forgot-pass-link:hover {
            color: var(--brand-primary-hover);
        }

        /* Responsive breakdown for smaller screens */
        @media (max-width: 860px) {
            .portal-card {
                flex-direction: column;
                max-width: 480px;
                min-height: auto;
            }

            .left-panel {
                flex: none;
                padding: 32px 30px 140px 30px;
            }

            .hero-heading {
                font-size: 1.85rem;
                margin-top: 24px;
            }

            .waves-wrapper {
                height: 180px;
            }

            .right-panel {
                flex: none;
                padding: 32px 30px 36px 30px;
            }
        }
    </style>
</head>
<body>

    <div class="portal-card">
        <!-- LEFT PANEL -->
        <section class="left-panel">
            <div class="brand-row">
                <!-- Logo Box with glowing petals and yellow core -->
                <div class="brand-logo" aria-hidden="true">
                    <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
                </div>
                <div class="brand-name-wrap">
                    <span class="brand-name-text">Benevo</span>
                    <span class="brand-yellow-dot" aria-hidden="true"></span>
                </div>
            </div>

            <h1 class="hero-heading">
                Akses Kendali<br>
                Penyaluran &amp; Audit
            </h1>

            <p class="hero-desc">
                Integritas data penyaluran bantuan sosial terdesentralisasi, transparansi donatur real-time, dan pengawasan berbasis audit independen.
            </p>

            <!-- Layered Waves Illustration -->
            <div class="waves-wrapper" aria-hidden="true">
                <svg viewBox="0 0 500 320" preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg">
                    <defs>
                        <linearGradient id="purpleMid" x1="0%" y1="0%" x2="100%" y2="100%">
                            <stop offset="0%" stop-color="#9d74cb" stop-opacity="0.9"/>
                            <stop offset="100%" stop-color="#7d4bb2" stop-opacity="0.95"/>
                        </linearGradient>
                        <linearGradient id="purpleDeep" x1="0%" y1="0%" x2="100%" y2="100%">
                            <stop offset="0%" stop-color="#7244a5"/>
                            <stop offset="100%" stop-color="#552c8b"/>
                        </linearGradient>
                    </defs>

                    <!-- Wave 1: Soft lilac background curve -->
                    <path d="M 0 150 C 110 170 190 230 360 195 C 430 180 470 165 500 155 L 500 320 L 0 320 Z" fill="#cfbfe8" fill-opacity="0.6"/>

                    <!-- Wave 2: Warm Sunny Yellow Wave (Rising hill crest on the right) -->
                    <path d="M 120 320 C 170 260 250 195 375 180 C 430 174 470 185 500 205 L 500 320 Z" fill="#fae48f"/>

                    <!-- Wave 3: Mid Purple Flowing Wave -->
                    <path d="M 0 170 C 80 220 165 240 270 230 C 370 220 440 250 500 265 L 500 320 L 0 320 Z" fill="url(#purpleMid)"/>

                    <!-- Wave 4: Deep foreground purple wave -->
                    <path d="M 0 220 C 80 255 170 250 240 235 C 320 215 400 240 500 300 L 500 320 L 0 320 Z" fill="url(#purpleDeep)"/>

                    <!-- Wave 5: Rich bottom solid purple curve -->
                    <path d="M 0 250 C 90 270 160 275 230 260 C 310 245 370 265 460 320 L 0 320 Z" fill="#522c88"/>
                </svg>
            </div>
        </section>

        <!-- RIGHT PANEL -->
        <main class="right-panel">
            <h2 class="panel-heading">Benevo CMS Portal</h2>
            <p class="panel-sub">
                Portal Manajemen &amp; Monitoring Donasi<br>
                (admin &amp; operator)
            </p>

            <form action="{{ route('dashboard') }}" method="GET" id="loginForm">
                <div class="role-section-label">Pilih Jenis Akses</div>
                
                <div class="role-segment" role="tablist" aria-label="Pilih jenis akses">
                    <button type="button" class="role-btn active" id="btnAdmin" onclick="selectRole('admin')">
                        <!-- Admin person icon -->
                        <svg viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                            <path d="M12 12.5l1.2 2.5h-2.4z"/>
                        </svg>
                        Admin
                    </button>
                    <button type="button" class="role-btn" id="btnOperator" onclick="selectRole('operator')">
                        <!-- Operator person icon -->
                        <svg viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M12 2C6.48 2 2 6.48 2 12v4c0 1.1.9 2 2 2h1v-6c0-3.87 3.13-7 7-7s7 3.13 7 7v6h1c1.1 0 2-.9 2-2v-4c0-5.52-4.48-10-10-10z"/>
                            <path d="M12 14c1.66 0 3-1.34 3-3V9c0-1.66-1.34-3-3-3S9 7.34 9 9v2c0 1.66 1.34 3 3 3z"/>
                            <path d="M7 16H6c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-2c0-.55-.45-1-1-1zm11 0h-1c-.55 0-1 .45-1 1v2c0 .55.45 1 1 1h1c.55 0 1-.45 1-1v-2c0-.55-.45-1-1-1z"/>
                        </svg>
                        Operator
                    </button>
                </div>

                <!-- Input: Email Atau ID -->
                <div class="field-group">
                    <label class="field-label" for="emailField">Email Atau ID</label>
                    <div class="field-input-box">
                        <span class="field-icon" aria-hidden="true">
                            <!-- Circle User Icon -->
                            <svg viewBox="0 0 24 24" fill="currentColor">
                                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 4c1.93 0 3.5 1.57 3.5 3.5S13.93 13 12 13s-3.5-1.57-3.5-3.5S10.07 6 12 6zm0 14c-2.03 0-4.43-.82-6.14-2.88C7.55 15.8 9.68 15 12 15s4.45.8 6.14 2.12C16.43 19.18 14.03 20 12 20z"/>
                            </svg>
                        </span>
                        <input type="text" id="emailField" class="input-element" value="admin@benevo.org" placeholder="admin@benevo.org" autocomplete="username">
                    </div>
                </div>

                <!-- Input: Kata Sandi -->
                <div class="field-group">
                    <label class="field-label" for="passwordField">Kata Sandi</label>
                    <div class="field-input-box">
                        <span class="field-icon" aria-hidden="true">
                            <!-- Padlock Icon -->
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                                <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                            </svg>
                        </span>
                        <input type="password" id="passwordField" class="input-element" placeholder="masukan kata sandi" autocomplete="current-password">
                        <button type="button" class="password-toggle-btn" id="togglePasswordBtn" onclick="togglePassword()" aria-label="Tampilkan atau sembunyikan kata sandi">
                            <!-- Eye Icon -->
                            <svg id="eyeSvg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                                <circle cx="12" cy="12" r="3"/>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Remember Checkbox -->
                <label class="remember-container">
                    <input type="checkbox" class="remember-checkbox" checked id="rememberBox">
                    <span class="remember-text">Simpan Informasi Akun</span>
                </label>

                <!-- Submit Button -->
                <button type="submit" class="login-submit-btn" id="submitActionBtn">
                    <!-- Login Arrow Icon -->
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/>
                        <polyline points="10 17 15 12 10 7"/>
                        <line x1="15" y1="12" x2="3" y2="12"/>
                    </svg>
                    <span id="submitLabel">Masuk Sebagai Admin</span>
                </button>

                <!-- Forgot Password -->
                <div class="forgot-pass-wrap">
                    <a href="#" class="forgot-pass-link">Lupa Kata Sandi?</a>
                </div>
            </form>
        </main>
    </div>

    <script>
        let selectedRole = 'admin';

        function selectRole(role) {
            selectedRole = role;
            const btnAdmin = document.getElementById('btnAdmin');
            const btnOperator = document.getElementById('btnOperator');
            const emailField = document.getElementById('emailField');
            const submitLabel = document.getElementById('submitLabel');

            if (role === 'admin') {
                btnAdmin.classList.add('active');
                btnOperator.classList.remove('active');
                emailField.value = 'admin@benevo.org';
                emailField.placeholder = 'admin@benevo.org';
                submitLabel.textContent = 'Masuk Sebagai Admin';
            } else {
                btnOperator.classList.add('active');
                btnAdmin.classList.remove('active');
                emailField.value = 'operator@benevo.org';
                emailField.placeholder = 'operator@benevo.org';
                submitLabel.textContent = 'Masuk Sebagai Operator';
            }
        }

        function togglePassword() {
            const passwordField = document.getElementById('passwordField');
            const eyeSvg = document.getElementById('eyeSvg');

            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                eyeSvg.innerHTML = `
                    <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
                    <line x1="1" y1="1" x2="23" y2="23"/>
                `;
            } else {
                passwordField.type = 'password';
                eyeSvg.innerHTML = `
                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                    <circle cx="12" cy="12" r="3"/>
                `;
            }
        }

        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            window.location.href = "{{ route('dashboard') }}";
        });
    </script>
</body>
</html>
