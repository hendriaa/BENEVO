<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Rekapitulasi Dana Operator</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
    <style>
        :root {
            --bg-page: #f5f0fa;
            --bg-sidebar: #ffffff;
            --bg-card: #ffffff;
            --brand-purple: #855cb8;
            --brand-purple-dark: #2d164d;
            --brand-purple-header: #8b63c7;
            --brand-yellow: #f4d566;
            --brand-text-dark: #1f1b26;
            --brand-text-muted: #6e727e;
            --brand-border: #ede6f5;
            --brand-border-card: #e8dfef;
            --badge-green-bg: #cbf9d9;
            --badge-green-text: #199447;
            --badge-blue-bg: #dbeafe;
            --badge-blue-text: #1d4ed8;
            --badge-orange-bg: #ffedd5;
            --badge-orange-text: #c2410c;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            background-color: var(--bg-page);
            color: var(--brand-text-dark);
            min-height: 100vh;
            display: flex;
            -webkit-font-smoothing: antialiased;
        }

        .sidebar {
            width: 275px;
            max-width: 275px;
            background-color: var(--bg-sidebar);
            border-right: 1px solid var(--brand-border);
            display: flex;
            flex-direction: column;
            padding: 28px 20px 24px 20px;
            flex-shrink: 0;
            min-height: 100vh;
            height: 100vh;
            position: sticky;
            top: 0;
            align-self: flex-start;
            overflow-y: auto;
            z-index: 100;
        }

        .sidebar-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
        }

        .brand-logo-badge {
            width: 38px;
            height: 38px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            overflow: hidden;
        }

        .brand-logo-badge img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .brand-wordmark {
            font-size: 2.15rem;
            font-weight: 800;
            letter-spacing: -0.04em;
            line-height: 0.95;
            color: #6d3ca1;
        }

        .brand-yellow-dot {
            position: absolute;
            right: -8px;
            top: 4px;
            width: 9px;
            height: 9px;
            background-color: var(--brand-yellow);
            border-radius: 50%;
        }

        .nav-section {
            margin-top: 24px;
        }

        .nav-section-title {
            font-size: 0.85rem;
            font-weight: 600;
            color: #747783;
            margin-bottom: 12px;
            padding-left: 6px;
        }

        .nav-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 12px 16px;
            border-radius: 12px;
            text-decoration: none;
            font-size: 0.92rem;
            font-weight: 600;
            color: #555966;
            transition: all 0.2s ease;
        }

        .nav-link svg {
            width: 20px;
            height: 20px;
            flex-shrink: 0;
        }

        .nav-link:hover {
            background-color: #f6f0fc;
            color: #61389e;
        }

        .nav-link.active {
            background-color: var(--brand-purple);
            color: #ffffff;
            box-shadow: 0 4px 14px rgba(133, 92, 184, 0.35);
        }

        .main-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-width: 0;
            overflow-x: hidden;
        }

        .topbar {
            height: 72px;
            background-color: #ffffff;
            border-bottom: 1px solid var(--brand-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 36px;
            gap: 20px;
            flex-shrink: 0;
        }

        .search-container {
            position: relative;
            width: 100%;
            max-width: 380px;
        }

        .search-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ea2ae;
            display: flex;
            align-items: center;
            pointer-events: none;
        }

        .search-icon svg {
            width: 18px;
            height: 18px;
        }

        .search-input {
            width: 100%;
            height: 42px;
            background-color: #f6f0fc;
            border: 1px solid #ebdff5;
            border-radius: 9999px;
            padding: 0 16px 0 40px;
            font-size: 0.88rem;
            color: #2b2e38;
            outline: none;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .profile-pill {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
        }

        .profile-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
        }

        .profile-info {
            display: flex;
            flex-direction: column;
            line-height: 1.15;
        }

        .profile-name {
            font-size: 0.86rem;
            font-weight: 700;
            color: #232227;
        }

        .profile-role {
            font-size: 0.72rem;
            color: #797c88;
        }

        .content-area {
            padding: 30px 36px 40px 36px;
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .page-title {
            font-size: 2.15rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            letter-spacing: -0.025em;
        }

        .rekap-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            border: 1.5px solid var(--brand-border-card);
            padding: 24px 28px;
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.06);
            display: flex;
            flex-direction: column;
            gap: 18px;
            overflow-x: auto;
        }

        .rekap-card-title {
            font-size: 1.12rem;
            font-weight: 800;
            color: #1f1b26;
        }

        .rekap-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            text-align: left;
        }

        .rekap-table th {
            padding: 14px 18px;
            font-size: 0.92rem;
            font-weight: 700;
            color: #ffffff;
            background-color: var(--brand-purple-header);
            border: 1px solid #7c52ba;
        }

        .rekap-table th:first-child { border-top-left-radius: 10px; }
        .rekap-table th:last-child { border-top-right-radius: 10px; text-align: center; }

        .rekap-table td {
            padding: 16px 18px;
            font-size: 0.9rem;
            color: #1f1b26;
            vertical-align: middle;
            border: 1px solid #e8e0f3;
            background-color: #ffffff;
        }

        .status-pill {
            display: inline-block;
            padding: 5px 16px;
            border-radius: 9999px;
            font-size: 0.82rem;
            font-weight: 700;
            text-transform: capitalize;
        }

        .status-pill.aktif { background-color: var(--badge-green-bg); color: var(--badge-green-text); }
        .status-pill.dibekukan { background-color: var(--badge-blue-bg); color: var(--badge-blue-text); }
        .status-pill.selesai { background-color: var(--badge-orange-bg); color: var(--badge-orange-text); }

        .rekap-total-row td {
            background-color: var(--brand-purple-header);
            color: #ffffff;
            font-weight: 800;
            border-color: #7c52ba;
        }

        .pie-chart-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            border: 1.5px solid var(--brand-border-card);
            padding: 24px 28px;
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.06);
            max-width: 420px;
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .sidebar-footer {
            margin-top: auto;
            padding-top: 24px;
        }

        .logout-btn {
            display: flex;
            align-items: center;
            gap: 12px;
            background: none;
            border: none;
            cursor: pointer;
            padding: 10px 14px;
            border-radius: 10px;
            width: 100%;
            font-family: inherit;
        }

        .logout-btn span { font-weight: 700; color: #db6e6e; }
    </style>
</head>
<body>
    <aside class="sidebar">
        <a href="{{ route('operator.dashboard') }}" class="sidebar-brand">
            <div class="brand-logo-badge">
                <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
            </div>
            <div class="brand-text-block">
                <span class="brand-wordmark">Benevo</span>
            </div>
        </a>

        <div class="nav-section">
            <div class="nav-section-title">Menu Utama</div>
            <ul class="nav-list">
                <li><a href="{{ route('operator.dashboard') }}" class="nav-link"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7" rx="1.5"/><rect x="14" y="3" width="7" height="7" rx="1.5"/><rect x="14" y="14" width="7" height="7" rx="1.5"/><rect x="3" y="14" width="7" height="7" rx="1.5"/></svg>Dashboard</a></li>
                <li><a href="{{ route('operator.buat-kampanye') }}" class="nav-link"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 5v14M5 12h14"/></svg>Buat Kampanye</a></li>
                <li><a href="{{ route('operator.catatan-pengeluaran-donasi') }}" class="nav-link"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/></svg>Catatan Pengeluaran</a></li>
                <li><a href="{{ route('operator.rekapitulasi-dana') }}" class="nav-link active"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/><path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/></svg>Rekapitulasi Dana</a></li>
            </ul>
        </div>

        <div class="sidebar-footer">
            <form action="{{ route('logout') }}" method="POST">
                @csrf
                <button type="submit" class="logout-btn">
                    <svg viewBox="0 0 24 24" fill="none" stroke="#db6e6e" stroke-width="2.2" width="20" height="20"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
                    <span>Log out</span>
                </button>
            </form>
        </div>
    </aside>

    <div class="main-wrapper">
        <header class="topbar">
            <div class="search-container">
                <span class="search-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg></span>
                <input type="text" class="search-input" placeholder="Cari Apapun...">
            </div>
            <div class="topbar-right">
                <div class="profile-pill">
                    <div class="profile-info">
                        <span class="profile-name">Operator Benevo</span>
                        <span class="profile-role">Operator</span>
                    </div>
                </div>
            </div>
        </header>

        <main class="content-area">
            <h1 class="page-title">Rekap Seluruh Penggunaan Dana</h1>
            <div class="rekap-card">
                <h2 class="rekap-card-title">Rekap seluruh penggunaan Dana pada Kampanye</h2>
                <table class="rekap-table">
                    <thead>
                        <tr>
                            <th>Kampanye</th>
                            <th>Dana Terkumpul / Target</th>
                            <th>Tersalurkan</th>
                            <th>Saldo</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>Bantu Korban Banjir Bandung Fontaine</td><td><strong>Rp 40.000.000</strong> / Rp 65.000.000</td><td>Rp 35.000.000</td><td>Rp 35.000.000</td><td style="text-align:center;"><span class="status-pill aktif">Aktif</span></td></tr>
                        <tr><td>Sumbangan Berkah Panti Asuhan Fathul</td><td><strong>Rp 43.500.000</strong> / Rp 65.000.000</td><td>Rp 10.000.000</td><td>Rp 33.500.000</td><td style="text-align:center;"><span class="status-pill dibekukan">Dibekukan</span></td></tr>
                        <tr><td>Pengecoran jalan desa purukan</td><td><strong>Rp 51.900.000</strong> / Rp 67.000.000</td><td>Rp 25.000.000</td><td>Rp 26.900.000</td><td style="text-align:center;"><span class="status-pill selesai">Selesai</span></td></tr>
                        <tr><td>Penanaman 250.000 pohon di Sumatra</td><td><strong>Rp 89.300.000</strong> / Rp 100.000.000</td><td>Rp 20.000.000</td><td>Rp 69.300.000</td><td style="text-align:center;"><span class="status-pill aktif">Aktif</span></td></tr>
                        <tr><td>Beasiswa untuk anak - anak desa pelosok</td><td><strong>Rp 57.790.000</strong> / Rp 90.000.000</td><td>Rp 17.000.000</td><td>Rp 40.790.000</td><td style="text-align:center;"><span class="status-pill aktif">Aktif</span></td></tr>
                        <tr class="rekap-total-row"><td>Total seluruh Kampanye</td><td>Rp 282.490.000 / Rp 387.000.000</td><td>Rp 107.000.000</td><td>Rp 175.490.000</td><td></td></tr>
                    </tbody>
                </table>
            </div>

            <div class="pie-chart-card">
                <h2 style="font-size:1.05rem; font-weight:800;">Penggunaan dana per kategori</h2>
                <div style="height:250px;"><canvas id="operatorPieChart"></canvas></div>
            </div>
        </main>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('operatorPieChart').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: ['Perlengkapan (22%)', 'Kebutuhan Pokok (12%)', 'Pakaian (16%)', 'Obat Obatan (22%)', 'Sembako (28%)'],
                    datasets: [{
                        data: [22, 12, 16, 22, 28],
                        backgroundColor: ['#8e62d4', '#c4a11f', '#4a1f28', '#59212c', '#3b2668'],
                        borderWidth: 1.5,
                        borderColor: '#ffffff'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { position: 'bottom' } }
                }
            });
        });
    </script>
</body>
</html>