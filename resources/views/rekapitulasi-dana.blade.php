<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Rekapitulasi Dana</title>
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
            --badge-blue-bg: #bae6fd;
            --badge-blue-text: #0284c7;
            --badge-orange-bg: #fed7aa;
            --badge-orange-text: #ea580c;
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

        /* ----------------- SIDEBAR ----------------- */
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
            padding-left: 0;
            text-decoration: none;
            margin-bottom: 28px;
        }

        .brand-logo-badge {
            width: 44px;
            height: 44px;
            border-radius: 12px;
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

        .brand-text-block {
            display: flex;
            flex-direction: column;
            line-height: 1;
        }

        .brand-wordmark-wrap {
            position: relative;
            display: inline-flex;
            align-items: center;
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

        .brand-platform-sub {
            font-size: 0.62rem;
            font-weight: 800;
            letter-spacing: 0.12em;
            color: #6d3ca1;
            margin-top: 2px;
            text-transform: uppercase;
        }

        /* Modus Operasi Banner */
        .mode-banner {
            margin-top: 28px;
            background-color: #f0e8fc;
            border-radius: 12px;
            padding: 12px 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }

        .mode-left {
            display: flex;
            align-items: center;
            gap: 10px;
            min-width: 0;
        }

        .mode-dot {
            width: 10px;
            height: 10px;
            background-color: #61389e;
            border-radius: 50%;
            display: inline-block;
            flex-shrink: 0;
        }

        .mode-title {
            font-size: 0.88rem;
            font-weight: 700;
            color: #3b2260;
            line-height: 1.2;
        }

        .mode-sub {
            font-size: 0.76rem;
            color: #6d3ca1;
            font-weight: 500;
            line-height: 1.2;
            margin-top: 2px;
        }

        .mode-badge {
            background-color: #f2d8b4;
            color: #8a5515;
            font-size: 0.72rem;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 6px;
            box-shadow: inset 0 0 0 1px rgba(112, 78, 22, 0.08);
            flex-shrink: 0;
        }

        .nav-section {
            margin-top: 24px;
        }

        .nav-section-title {
            font-size: 0.85rem;
            font-weight: 600;
            color: #747783;
            margin-bottom: 14px;
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

        .nav-link.active svg {
            stroke: #ffffff;
            fill: none;
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
            transition: all 0.2s ease;
            text-align: left;
            text-decoration: none;
        }

        .logout-btn:hover {
            background-color: #fff1f1;
        }

        .logout-btn svg {
            width: 20px;
            height: 20px;
            stroke: #df584f;
            flex-shrink: 0;
        }

        .logout-btn span {
            font-size: 0.95rem;
            font-weight: 700;
            color: #df584f;
        }

        /* ----------------- MAIN WRAPPER ----------------- */
        .main-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-width: 0;
            overflow-x: hidden;
        }

        /* Topbar Header */
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
            max-width: 420px;
        }

        .search-icon {
            position: absolute;
            left: 16px;
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
            background-color: #ffffff;
            border: 1px solid #e7dff2;
            border-radius: 9999px;
            padding: 0 16px 0 44px;
            font-size: 0.88rem;
            color: #2b2e38;
            outline: none;
            transition: all 0.2s;
        }

        .search-input:focus {
            background-color: #ffffff;
            border-color: var(--brand-purple);
            box-shadow: 0 0 0 2px rgba(133, 92, 184, 0.15);
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .date-picker-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            height: 40px;
            padding: 0 14px;
            background-color: #ffffff;
            border: 1px solid #e7dff2;
            border-radius: 8px;
            font-size: 0.82rem;
            font-weight: 600;
            color: #4b4f5a;
            cursor: pointer;
        }

        .date-picker-btn svg {
            width: 16px;
            height: 16px;
        }

        .icon-action-btn {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            background-color: #ffffff;
            border: 1px solid #e7dff2;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #555966;
            cursor: pointer;
            position: relative;
        }

        .notif-badge-dot {
            position: absolute;
            top: 7px;
            right: 8px;
            width: 7px;
            height: 7px;
            background-color: #ef4444;
            border-radius: 50%;
            border: 1.5px solid #ffffff;
        }

        .help-action-btn {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #8c68c2;
            color: #ffffff;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.88rem;
            font-weight: 800;
            cursor: pointer;
        }

        .profile-pill {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 4px 10px 4px 4px;
            border-radius: 20px;
            cursor: pointer;
        }

        .profile-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
            border: 1.5px solid #d4c2ed;
            background: #e7dfd5;
        }

        .profile-info {
            display: flex;
            flex-direction: column;
            line-height: 1.15;
        }

        .profile-name {
            font-size: 0.86rem;
            font-weight: 700;
            color: #1f1b26;
        }

        .profile-role {
            font-size: 0.72rem;
            color: #757987;
            font-weight: 500;
        }

        /* ----------------- PAGE CONTENT ----------------- */
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

        /* Top 2 Metric Cards */
        .metrics-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
        }

        .metric-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            padding: 24px 28px;
            box-shadow: 0 4px 18px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .metric-label {
            font-size: 0.88rem;
            font-weight: 700;
            color: #2b2c34;
        }

        .metric-val-wrap {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .metric-val {
            font-size: 1.85rem;
            font-weight: 800;
            color: #1f1b26;
            letter-spacing: -0.02em;
        }

        .trend-arrow {
            width: 24px;
            height: 24px;
            color: #5c3899;
        }

        /* Generic Content Card */
        .content-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            padding: 26px 28px;
            box-shadow: 0 4px 18px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .card-header-flex {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 16px;
            flex-wrap: wrap;
        }

        .card-title {
            font-size: 1.45rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            letter-spacing: -0.02em;
            line-height: 1.2;
        }

        .card-subtitle {
            font-size: 0.8rem;
            color: #888c99;
            font-weight: 500;
            margin-top: 3px;
        }

        .card-header-controls {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .ctrl-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #ffffff;
            border: 1px solid #dcd3ea;
            border-radius: 8px;
            padding: 6px 14px;
            font-size: 0.82rem;
            font-weight: 600;
            color: #4a4e5a;
            cursor: pointer;
            font-family: inherit;
        }

        .ctrl-pill svg {
            width: 14px;
            height: 14px;
            color: #6d3ca1;
        }

        .ctrl-pill .caret {
            font-size: 0.7rem;
            color: #797c88;
            margin-left: 2px;
        }

        .legend-group {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .legend-item {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 0.82rem;
            font-weight: 600;
            color: #3b3c44;
        }

        .legend-dot {
            width: 9px;
            height: 9px;
            border-radius: 50%;
            display: inline-block;
        }

        .dot-yellow {
            background-color: #f2be3b;
        }

        .dot-purple {
            background-color: #5a3994;
        }

        .dot-purple-bright {
            background-color: #873be8;
        }

        /* Card 2: Aktivitas Dana */
        .aktivitas-body {
            display: flex;
            gap: 28px;
            align-items: center;
        }

        .chart-with-arrows {
            display: flex;
            align-items: center;
            gap: 12px;
            flex: 1;
            min-width: 0;
        }

        .carousel-arrow {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            border: none;
            background-color: #e5e0ed;
            color: #797c88;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            flex-shrink: 0;
            transition: background 0.15s;
        }

        .carousel-arrow:hover {
            background-color: #d8d1e3;
            color: #333;
        }

        .carousel-arrow svg {
            width: 16px;
            height: 16px;
        }

        .aktivitas-side-stats {
            width: 230px;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .stat-pill-box {
            background: #ffffff;
            border: 1.5px solid #ece4f6;
            border-radius: 16px;
            padding: 16px 18px;
            box-shadow: 0 2px 10px rgba(100, 60, 150, 0.04);
        }

        .stat-pill-label {
            font-size: 0.82rem;
            font-weight: 700;
            color: #4b4e5a;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .stat-inline-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            display: inline-block;
        }

        .stat-pill-amount {
            font-size: 1.22rem;
            font-weight: 800;
            color: #1f1b26;
            margin: 6px 0 10px 0;
        }

        .stat-segments {
            display: flex;
            gap: 4px;
            width: 100%;
        }

        .stat-segments .seg {
            flex: 1;
            height: 8px;
            border-radius: 3px;
        }

        .seg-purple {
            background-color: #522d86;
        }

        .seg-yellow {
            background-color: #f2be3b;
        }

        .seg-gray {
            background-color: #e8e3f0;
        }

        /* Card 3: Data Mutasi Table */
        .action-filter-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #ffffff;
            border: 1.5px solid #d9cfee;
            border-radius: 8px;
            padding: 8px 14px;
            font-size: 0.82rem;
            font-weight: 600;
            color: #4a4e5a;
            cursor: pointer;
            font-family: inherit;
            transition: all 0.15s;
        }

        .action-filter-btn:hover {
            border-color: #855cb8;
            color: #855cb8;
        }

        .action-filter-btn svg {
            width: 15px;
            height: 15px;
            color: #6d3ca1;
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
        }

        .mutasi-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            text-align: left;
        }

        .mutasi-table th {
            background-color: #cbbde4;
            color: #1f1b26;
            font-size: 0.85rem;
            font-weight: 800;
            padding: 12px 16px;
            border: none;
            letter-spacing: -0.01em;
        }

        .mutasi-table th:first-child {
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
        }

        .mutasi-table th:last-child {
            border-top-right-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .mutasi-table td {
            padding: 14px 16px;
            font-size: 0.88rem;
            color: #1f1b26;
            vertical-align: middle;
            border-bottom: 1px solid #f0eaf7;
        }

        .mutasi-table tr:hover td {
            background-color: #faf7fd;
        }

        .mutasi-table .td-id {
            font-weight: 700;
            color: #1f1b26;
            font-size: 0.82rem;
        }

        .mutasi-table .td-time,
        .mutasi-table .td-donor {
            font-weight: 600;
            color: #1f1b26;
            line-height: 1.35;
        }

        .mutasi-table .sub-line {
            display: block;
            font-size: 0.74rem;
            font-weight: 500;
            color: #888c99;
            margin-top: 2px;
        }

        .mutasi-table .td-campaign {
            font-weight: 600;
            color: #272132;
        }

        .mutasi-table .td-channel {
            font-weight: 600;
            color: #333;
        }

        .mutasi-table .td-amount {
            font-weight: 700;
            color: #1f1b26;
        }

        /* Pagination */
        .table-pagination-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 12px;
        }

        .pagination-info {
            font-size: 0.8rem;
            color: #888c99;
            font-weight: 500;
        }

        .pagination-buttons {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .pg-arrow-btn,
        .pg-num-btn {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            border: 1px solid #e0d7ee;
            background: #ffffff;
            color: #555866;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.82rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.15s;
        }

        .pg-arrow-btn svg {
            width: 14px;
            height: 14px;
        }

        .pg-num-btn.active {
            background-color: #855cb8;
            border-color: #855cb8;
            color: #ffffff;
        }

        .pg-arrow-btn:hover,
        .pg-num-btn:hover {
            border-color: #855cb8;
            color: #855cb8;
        }
        .pg-num-btn.active:hover {
            color: #ffffff;
        }

        /* ================= LOGOUT MODAL ================= */
        .logout-modal-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(30, 20, 50, 0.45);
            backdrop-filter: blur(2px);
            -webkit-backdrop-filter: blur(2px);
            z-index: 99999;
            display: none;
            align-items: center;
            justify-content: center;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.25s ease;
        }

        .logout-modal-backdrop.show {
            display: flex !important;
            opacity: 1 !important;
            pointer-events: auto !important;
        }

        .logout-modal-card {
            background: #ffffff;
            width: 90%;
            max-width: 580px;
            border-radius: 28px;
            padding: 38px 40px 34px 40px;
            box-shadow: 0 25px 60px -10px rgba(0, 0, 0, 0.22);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            transform: scale(0.92);
            transition: transform 0.25s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .logout-modal-backdrop.show .logout-modal-card {
            transform: scale(1);
        }

        .logout-modal-logo {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 4px;
            margin-bottom: 20px;
        }

        .logout-modal-logo-img {
            width: 52px;
            height: 52px;
            object-fit: contain;
            display: block;
        }

        .logout-modal-logo-text {
            font-size: 1.65rem;
            font-weight: 800;
            letter-spacing: -0.025em;
            background: linear-gradient(90deg, #502b8d 0%, #855cb8 50%, #e2c044 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            line-height: 1.2;
        }

        .logout-modal-title {
            font-size: 1.75rem;
            font-weight: 800;
            color: #1f1b26;
            margin-bottom: 32px;
            letter-spacing: -0.02em;
        }

        .logout-modal-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            width: 100%;
        }

        .logout-btn-cancel {
            height: 54px;
            border-radius: 16px;
            border: 2px solid #cfcfcf;
            background: #ffffff;
            color: #4a4e5a;
            font-size: 1.45rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            font-family: inherit;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        .logout-btn-cancel:hover {
            background-color: #f5f5f7;
            border-color: #b0b0b0;
            color: #222;
        }

        .logout-btn-confirm {
            height: 54px;
            border-radius: 16px;
            border: none;
            background: #ff4040;
            color: #ffffff;
            font-size: 1.45rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            font-family: inherit;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            box-shadow: 0 6px 18px rgba(255, 64, 64, 0.35);
        }

        .logout-btn-confirm:hover {
            background: #e62e2e;
            transform: translateY(-1px);
            box-shadow: 0 8px 22px rgba(255, 64, 64, 0.45);
        }
    </style>
</head>
<body>

    <!-- ---------------- SIDEBAR ---------------- -->
    <aside class="sidebar">
        <!-- Brand Logo & Wordmark -->
        <a href="{{ route('dashboard') }}" class="sidebar-brand">
            <div class="brand-logo-badge" aria-hidden="true">
                <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
            </div>
            <div class="brand-text-block">
                <div class="brand-wordmark-wrap">
                    <span class="brand-wordmark">Benevo</span>
                    <span class="brand-yellow-dot" aria-hidden="true"></span>
                </div>
                <span class="brand-platform-sub">CMS PLATFORM</span>
            </div>
        </a>

        <!-- Modus Operasi Banner -->
        <div class="mode-banner">
            <div class="mode-left">
                <span class="mode-dot"></span>
                <div>
                    <div class="mode-title">Modus Operasi</div>
                    <div class="mode-sub">Admin</div>
                </div>
            </div>
            <span class="mode-badge">Aktif</span>
        </div>

        <!-- Section: Menu Utama -->
        <div class="nav-section">
            <div class="nav-section-title">Menu Utama</div>
            <ul class="nav-list">
                <li>
                    <a href="{{ route('dashboard') }}" class="nav-link">
                        <!-- Dashboard Grid Icon -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="3" width="7" height="7" rx="1.5"/>
                            <rect x="14" y="3" width="7" height="7" rx="1.5"/>
                            <rect x="14" y="14" width="7" height="7" rx="1.5"/>
                            <rect x="3" y="14" width="7" height="7" rx="1.5"/>
                        </svg>
                        Dashboard
                    </a>
                </li>
                <li>
                    <a href="{{ route('rekapitulasi-dana') }}" class="nav-link active">
                        <!-- Rekapitulasi Dana (ACTIVE) -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/>
                            <path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/>
                            <path d="M18 12a2 2 0 0 0 0 4h4v-4z"/>
                        </svg>
                        Rekaptulasi Dana
                    </a>
                </li>
                <li>
                    <a href="{{ route('manajemen-kampanye') }}" class="nav-link">
                        <!-- Manajemen Kampanye -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 11l18-5v12L3 14v-3z"/>
                            <path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/>
                        </svg>
                        Manajemen Kampanye
                    </a>
                </li>
                <li>
                    <a href="{{ route('donatur') }}" class="nav-link">
                        <!-- Donatur / Users Icon -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M22 21v-2a4 4 0 0 0-3-3.87"/>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                        </svg>
                        Donatur
                    </a>
                </li>
            </ul>
        </div>

        <!-- Section: Admin -->
        <div class="nav-section">
            <div class="nav-section-title">Admin</div>
            <ul class="nav-list">
                <li>
                    <a href="{{ route('kelola-akun-operator') }}" class="nav-link">
                        <!-- Kelola Akun Operator / Settings Icon -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                        Kelola Akun Operator
                    </a>
                </li>
            </ul>
        </div>

        <!-- Sidebar Bottom: Log out -->
        <div class="sidebar-footer">
            <button type="button" class="logout-btn" onclick="openLogoutModal()" aria-label="Log out">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
                    <polyline points="16 17 21 12 16 7"/>
                    <line x1="21" y1="12" x2="9" y2="12"/>
                </svg>
                <span>Log out</span>
            </button>
        </div>
    </aside>

    <!-- ---------------- MAIN CONTENT WRAPPER ---------------- -->
    <div class="main-wrapper">
        <!-- Top Navbar -->
        <header class="topbar">
            <!-- Search bar -->
            <div class="search-container">
                <span class="search-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"/>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                    </svg>
                </span>
                <input type="text" class="search-input" placeholder="Cari Apapun...">
            </div>

            <!-- Right Actions -->
            <div class="topbar-right">
                <!-- Date Filter Dropdown -->
                <button class="date-picker-btn" type="button">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect x="3" y="4" width="18" height="18" rx="2"/>
                        <line x1="16" y1="2" x2="16" y2="6"/>
                        <line x1="8" y1="2" x2="8" y2="6"/>
                        <line x1="3" y1="10" x2="21" y2="10"/>
                    </svg>
                    <span>30 Hari Terakhir</span>
                    <svg viewBox="0 0 24 24" fill="currentColor" style="width:10px; height:10px; margin-left:2px;">
                        <path d="M7 10l5 5 5-5z"/>
                    </svg>
                </button>

                <!-- Notifications -->
                <button class="icon-action-btn" type="button" aria-label="Notifikasi">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
                        <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                    </svg>
                    <span class="notif-badge-dot"></span>
                </button>

                <!-- Help -->
                <button class="help-action-btn" type="button" aria-label="Bantuan">?</button>

                <!-- Profile -->
                <div class="profile-pill" onclick="openLogoutModal()" title="Klik untuk keluar" role="button" tabindex="0">
                    <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=120&q=80" alt="Avatar Harry Vaughan" class="profile-avatar">
                    <div class="profile-info">
                        <span class="profile-name">Harry Vaughan</span>
                        <span class="profile-role">Admin</span>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content Area -->
        <main class="content-area">
            <h1 class="page-title">Rekaptulasi Dana</h1>

            <!-- Top 2 Metric Cards -->
            <div class="metrics-row">
                <div class="metric-card">
                    <div class="metric-label">Total Dana Terkumpul</div>
                    <div class="metric-val-wrap">
                        <span class="metric-val">RP 689.721.095</span>
                        <svg class="trend-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="7" y1="17" x2="17" y2="7"></line>
                            <polyline points="7 7 17 7 17 17"></polyline>
                        </svg>
                    </div>
                </div>
                <div class="metric-card">
                    <div class="metric-label">Total Dana Tersalurkan</div>
                    <div class="metric-val-wrap">
                        <span class="metric-val">RP 532.775.241</span>
                        <svg class="trend-arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="7" y1="17" x2="17" y2="7"></line>
                            <polyline points="7 7 17 7 17 17"></polyline>
                        </svg>
                    </div>
                </div>
            </div>

            <!-- Card 1: Arus Dana (Line Chart) -->
            <div class="content-card">
                <div class="card-header-flex">
                    <div>
                        <h2 class="card-title">Arus Dana</h2>
                        <p class="card-subtitle">rekapitulasi dana yang terkumpul dan telah tersalurkan selama 30 hari</p>
                    </div>
                    <div class="card-header-controls">
                        <button type="button" class="ctrl-pill">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                            <span>October</span>
                            <span class="caret">▾</span>
                        </button>
                        <div class="legend-group">
                            <span class="legend-item"><span class="legend-dot dot-yellow"></span>Terkumpul</span>
                            <span class="legend-item"><span class="legend-dot dot-purple"></span>Tersalurkan</span>
                        </div>
                    </div>
                </div>
                <div style="height: 250px; width: 100%; position: relative;">
                    <canvas id="arusDanaChart"></canvas>
                </div>
            </div>

            <!-- Card 2: Aktivitas Dana (Grouped Bar Chart + Side Stats) -->
            <div class="content-card">
                <div class="card-header-flex">
                    <div>
                        <h2 class="card-title">Aktivitas Dana</h2>
                        <p class="card-subtitle">Rekapitulasi dana yang masuk dan cair setiap minggu</p>
                    </div>
                    <div class="card-header-controls">
                        <button type="button" class="ctrl-pill">
                            <span>October</span>
                            <span class="caret">▾</span>
                        </button>
                        <div class="legend-group">
                            <span class="legend-item"><span class="legend-dot dot-yellow"></span>Pencairan</span>
                            <span class="legend-item"><span class="legend-dot dot-purple-bright"></span>Pemasukan</span>
                        </div>
                    </div>
                </div>
                <div class="aktivitas-body">
                    <div class="chart-with-arrows">
                        <button type="button" class="carousel-arrow" aria-label="Sebelumnya">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="15 18 9 12 15 6"/></svg>
                        </button>
                        <div style="height: 230px; flex: 1; position: relative;">
                            <canvas id="aktivitasDanaChart"></canvas>
                        </div>
                        <button type="button" class="carousel-arrow" aria-label="Selanjutnya">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg>
                        </button>
                    </div>
                    <div class="aktivitas-side-stats">
                        <div class="stat-pill-box">
                            <div class="stat-pill-label">Pemasukan <span class="stat-inline-dot dot-purple-bright"></span></div>
                            <div class="stat-pill-amount">Rp 12.450.761</div>
                            <div class="stat-segments">
                                <span class="seg seg-purple"></span>
                                <span class="seg seg-purple"></span>
                                <span class="seg seg-purple"></span>
                                <span class="seg seg-purple"></span>
                                <span class="seg seg-purple"></span>
                                <span class="seg seg-purple"></span>
                                <span class="seg seg-purple"></span>
                            </div>
                        </div>
                        <div class="stat-pill-box">
                            <div class="stat-pill-label">Pencairan <span class="stat-inline-dot dot-yellow"></span></div>
                            <div class="stat-pill-amount">Rp 9.323.117</div>
                            <div class="stat-segments">
                                <span class="seg seg-yellow"></span>
                                <span class="seg seg-yellow"></span>
                                <span class="seg seg-yellow"></span>
                                <span class="seg seg-yellow"></span>
                                <span class="seg seg-yellow"></span>
                                <span class="seg seg-gray"></span>
                                <span class="seg seg-gray"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 3: Data Mutasi & Real - Time (Table) -->
            <div class="content-card">
                <div class="card-header-flex">
                    <div>
                        <h2 class="card-title">Data Mutasi &amp; Real - Time</h2>
                        <p class="card-subtitle">Aktivitas dana di dalam benevo</p>
                    </div>
                    <div class="card-header-controls">
                        <button type="button" class="action-filter-btn">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="5" width="20" height="14" rx="2"/><line x1="2" y1="10" x2="22" y2="10"/></svg>
                            <span>Jenis Pembayaran</span>
                        </button>
                        <button type="button" class="action-filter-btn">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 6v6l4 2"/></svg>
                            <span>Nominal</span>
                        </button>
                    </div>
                </div>

                <div class="table-container">
                    <table class="mutasi-table">
                        <thead>
                            <tr>
                                <th style="width: 10%;">ID</th>
                                <th style="width: 22%;">Waktu Transaksi</th>
                                <th style="width: 20%;">Nama Donatur</th>
                                <th style="width: 24%;">Kampanye Tujuan</th>
                                <th style="width: 12%;">Kanal Bayar</th>
                                <th style="width: 12%;">Nominal Bruto</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="td-id">BNV-PA11</td>
                                <td class="td-time">Senin, 12 October 2026<span class="sub-line">09:30 WIB</span></td>
                                <td class="td-donor">Anonim<span class="sub-line">IP: 192.168.72.10</span></td>
                                <td class="td-campaign">Bantu Padamkan Karhutla</td>
                                <td class="td-channel">QRIS</td>
                                <td class="td-amount">Rp 50.000</td>
                            </tr>
                            <tr>
                                <td class="td-id">BNV-SH12</td>
                                <td class="td-time">Senin, 12 October 2026<span class="sub-line">12:30 WIB</span></td>
                                <td class="td-donor">Hendria<span class="sub-line">@hn.drii_</span></td>
                                <td class="td-campaign">Bantu Padamkan Karhutla</td>
                                <td class="td-channel">GoPay</td>
                                <td class="td-amount">Rp 150.000</td>
                            </tr>
                            <tr>
                                <td class="td-id">BNV-MA12</td>
                                <td class="td-time">Senin, 12 October 2026<span class="sub-line">21:30 WIB</span></td>
                                <td class="td-donor">Asya<span class="sub-line">@ra.sya_</span></td>
                                <td class="td-campaign">Bantu Padamkan Karhutla</td>
                                <td class="td-channel">Seabank</td>
                                <td class="td-amount">Rp 200.000</td>
                            </tr>
                            <tr>
                                <td class="td-id">BNV-PF12</td>
                                <td class="td-time">Selasa, 13 October 2026<span class="sub-line">08:43 WIB</span></td>
                                <td class="td-donor">Fharel<span class="sub-line">@fh.arel_</span></td>
                                <td class="td-campaign">Bantuan Bencana Korban NTT</td>
                                <td class="td-channel">ShopeePay</td>
                                <td class="td-amount">Rp 250.000</td>
                            </tr>
                            <tr>
                                <td class="td-id">RNV-SA12</td>
                                <td class="td-time">Selasa, 13 October 2026<span class="sub-line">16:40 WIB</span></td>
                                <td class="td-donor">Aulia<span class="sub-line">@aul.liaa_</span></td>
                                <td class="td-campaign">Bantuan Bencana Korban NTT</td>
                                <td class="td-channel">Dana</td>
                                <td class="td-amount">Rp 300.000</td>
                            </tr>
                            <tr>
                                <td class="td-id">BNV-MA12</td>
                                <td class="td-time">Selasa, 13 October 2026<span class="sub-line">23:15 WIB</span></td>
                                <td class="td-donor">Zulfan<span class="sub-line">@zul.fan_</span></td>
                                <td class="td-campaign">Bantuan Bencana Korban NTT</td>
                                <td class="td-channel">QRIS</td>
                                <td class="td-amount">Rp 350.000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table-pagination-row">
                    <span class="pagination-info">Menampilkan 1 - 4 halaman</span>
                    <div class="pagination-buttons">
                        <button type="button" class="pg-arrow-btn" aria-label="Sebelumnya">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="15 18 9 12 15 6"/></svg>
                        </button>
                        <button type="button" class="pg-num-btn active">1</button>
                        <button type="button" class="pg-arrow-btn" aria-label="Selanjutnya">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg>
                        </button>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Chart Configuration Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 1. Arus Dana Line Chart
            try {
                const canvasArus = document.getElementById('arusDanaChart');
                if (canvasArus && typeof Chart !== 'undefined') {
                    const ctxArus = canvasArus.getContext('2d');
                    new Chart(ctxArus, {
                        type: 'line',
                        data: {
                            labels: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '11', '13', '15', '17', '18', '21', '23', '25', '27', '29'],
                            datasets: [
                                {
                                    label: 'Terkumpul',
                                    data: [580, 800, 720, 930, 750, 690, 310, 380, 70, 740, 110, 910, 600, 770, 100, 420, 290, 380, 70, 870],
                                    borderColor: '#e4b538',
                                    backgroundColor: 'transparent',
                                    borderWidth: 2,
                                    tension: 0.15,
                                    pointBackgroundColor: '#ffffff',
                                    pointBorderColor: '#e4b538',
                                    pointBorderWidth: 2,
                                    pointRadius: 4,
                                    pointHoverRadius: 6
                                },
                                {
                                    label: 'Tersalurkan',
                                    data: [710, 210, 520, 440, 930, 450, 650, 300, 410, 720, 830, 760, 840, 450, 930, 460, 760, 890, 860, 710],
                                    borderColor: '#5a3994',
                                    backgroundColor: 'transparent',
                                    borderWidth: 2,
                                    tension: 0.15,
                                    pointBackgroundColor: '#ffffff',
                                    pointBorderColor: '#5a3994',
                                    pointBorderWidth: 2,
                                    pointRadius: 4,
                                    pointHoverRadius: 6
                                }
                            ]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { display: false }
                            },
                            scales: {
                                x: {
                                    grid: {
                                        color: '#f0e8f8',
                                        drawBorder: false
                                    },
                                    ticks: {
                                        color: '#555866',
                                        font: { family: 'Plus Jakarta Sans', size: 11, weight: '600' }
                                    }
                                },
                                y: {
                                    min: 0,
                                    max: 1000,
                                    ticks: {
                                        stepSize: 250,
                                        color: '#555866',
                                        font: { family: 'Plus Jakarta Sans', size: 11, weight: '600' }
                                    },
                                    grid: {
                                        color: '#f0e8f8',
                                        drawBorder: false
                                    }
                                }
                            }
                        }
                    });
                }
            } catch(e) {
                console.warn('Arus Dana chart error:', e);
            }

            // 2. Aktivitas Dana Grouped Bar Chart
            try {
                const canvasAkt = document.getElementById('aktivitasDanaChart');
                if (canvasAkt && typeof Chart !== 'undefined') {
                    const ctxAkt = canvasAkt.getContext('2d');
                    new Chart(ctxAkt, {
                        type: 'bar',
                        data: {
                            labels: ['0', '1', '2', '3', '4', '5', '6', '7'],
                            datasets: [
                                {
                                    label: 'Pencairan',
                                    data: [72, 20, 50, 70, 82, 10, 14, 2],
                                    backgroundColor: '#f5dc61',
                                    borderRadius: 3,
                                    borderSkipped: false,
                                    barPercentage: 0.8,
                                    categoryPercentage: 0.65
                                },
                                {
                                    label: 'Pemasukan',
                                    data: [25, 96, 60, 44, 73, 6, 26, 3],
                                    backgroundColor: '#873be8',
                                    borderRadius: 3,
                                    borderSkipped: false,
                                    barPercentage: 0.8,
                                    categoryPercentage: 0.65
                                }
                            ]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: { display: false }
                            },
                            scales: {
                                x: {
                                    grid: {
                                        display: false
                                    },
                                    ticks: {
                                        color: '#555866',
                                        font: { family: 'Plus Jakarta Sans', size: 11, weight: '600' }
                                    }
                                },
                                y: {
                                    min: 0,
                                    max: 100,
                                    ticks: {
                                        stepSize: 25,
                                        color: '#555866',
                                        font: { family: 'Plus Jakarta Sans', size: 11, weight: '600' }
                                    },
                                    grid: {
                                        color: '#f0e8f8',
                                        drawBorder: false
                                    }
                                }
                            }
                        }
                    });
                }
            } catch(e) {
                console.warn('Aktivitas Dana chart error:', e);
            }
        });

        function openLogoutModal() {
            const modal = document.getElementById('logoutModal');
            if (modal) {
                modal.classList.add('show');
                document.body.style.overflow = 'hidden';
            }
        }

        function closeLogoutModal() {
            const modal = document.getElementById('logoutModal');
            if (modal) {
                modal.classList.remove('show');
                document.body.style.overflow = '';
            }
        }

        window.openLogoutModal = openLogoutModal;
        window.closeLogoutModal = closeLogoutModal;

        document.addEventListener('click', function(e) {
            const btn = e.target.closest('.logout-btn');
            if (btn) {
                e.preventDefault();
                openLogoutModal();
            }

            const modal = document.getElementById('logoutModal');
            if (e.target === modal) {
                closeLogoutModal();
            }
        });

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeLogoutModal();
            }
        });
    </script>

    <!-- ================= LOGOUT MODAL POPUP ================= -->
    <div class="logout-modal-backdrop" id="logoutModal" role="dialog" aria-modal="true" aria-labelledby="logoutModalTitle">
        <div class="logout-modal-card">
            <div class="logout-modal-logo">
                <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo" class="logout-modal-logo-img">
                <span class="logout-modal-logo-text">Benevo</span>
            </div>
            
            <h2 class="logout-modal-title" id="logoutModalTitle">Apakah anda yakin untuk Keluar?</h2>
            
            <div class="logout-modal-actions">
                <button type="button" class="logout-btn-cancel" onclick="closeLogoutModal()">Batal</button>
                <a href="{{ route('login') }}" class="logout-btn-confirm">Keluar</a>
            </div>
        </div>
    </div>
</body>
</html>
