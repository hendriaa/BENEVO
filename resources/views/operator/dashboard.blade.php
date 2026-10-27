<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Dashboard Operator</title>
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
            --brand-purple-dark: #2e144e;
            --brand-purple-bar: #583296;
            --brand-yellow-bar: #f8d849;
            --brand-text-dark: #1f1b26;
            --brand-text-muted: #6e727e;
            --brand-border: #ede6f5;
            --brand-border-card: #e9e0f3;
            --accent-badge-bg: #ece7f4;
            --accent-badge-text: #555966;
            --accent-red: #df584f;
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

        /* Brand Header */
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
            background: transparent;
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
            display: block;
            object-fit: contain;
        }

        .brand-text-block {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
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
            background-color: #f4d566;
            border-radius: 50%;
        }

        /* Navigation Links */
        .nav-section {
            margin-top: 8px;
            flex: 1;
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

        /* Sidebar Footer / Logout */
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
        }

        .logout-btn:hover {
            background-color: #fff1f1;
        }

        .logout-btn svg {
            width: 20px;
            height: 20px;
            stroke: #df584f;
            flex-shrink: 0;
            transition: stroke 0.2s;
        }

        .logout-btn span {
            font-size: 0.95rem;
            font-weight: 700;
            color: #df584f;
            transition: color 0.2s;
        }

        .logout-btn:hover svg {
            stroke: #c53830;
        }

        .logout-btn:hover span {
            color: #c53830;
        }

        /* ----------------- MAIN CONTENT WRAPPER ----------------- */
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

        /* Search input */
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

        .search-input::placeholder {
            color: #9fa3af;
        }

        /* Topbar Right Actions */
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
            transition: all 0.15s;
        }

        .date-picker-btn:hover {
            background-color: #fcfaff;
            border-color: #d8c9ed;
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
            transition: all 0.15s;
        }

        .icon-action-btn:hover {
            background-color: #fbf9fd;
            border-color: #d8c9ed;
            color: #61389e;
        }

        .icon-action-btn svg {
            width: 18px;
            height: 18px;
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
            box-shadow: 0 2px 6px rgba(140, 104, 194, 0.3);
            transition: transform 0.15s, background-color 0.15s;
        }

        .help-action-btn:hover {
            background-color: #7952b3;
            transform: scale(1.05);
        }

        .profile-pill {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 4px 10px 4px 4px;
            border-radius: 20px;
            cursor: pointer;
            user-select: none;
        }

        .profile-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            object-fit: cover;
            border: 1.5px solid #d4c2ed;
            flex-shrink: 0;
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
            gap: 22px;
        }

        .page-title {
            font-size: 2.15rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            letter-spacing: -0.025em;
        }

        /* ROW 1: 3 METRIC CARDS */
        .metrics-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .metric-card {
            background-color: var(--bg-card);
            border-radius: 18px;
            padding: 22px 24px;
            border: 1.5px solid var(--brand-border-card);
            box-shadow: 0 4px 18px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
            gap: 8px;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .metric-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 22px rgba(100, 60, 150, 0.09);
        }

        .metric-label {
            font-size: 0.95rem;
            font-weight: 700;
            color: #2a2533;
        }

        .metric-value {
            font-size: 1.95rem;
            font-weight: 800;
            color: var(--brand-text-dark);
            letter-spacing: -0.03em;
            line-height: 1.15;
        }

        /* ROW 2: AKTIVITAS SELURUH KAMPANYE (CHART + STATS) */
        .activity-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            padding: 26px 30px;
            border: 1.5px solid var(--brand-border-card);
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.06);
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .activity-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
        }

        .activity-title {
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            letter-spacing: -0.02em;
        }

        .activity-legend {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.88rem;
            font-weight: 600;
            color: #555966;
        }

        .legend-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            display: inline-block;
        }

        .legend-dot.yellow {
            background-color: var(--brand-yellow-bar);
        }

        .legend-dot.purple {
            background-color: var(--brand-purple-bar);
        }

        .activity-body {
            display: flex;
            gap: 24px;
            align-items: center;
        }

        .chart-carousel-wrapper {
            flex: 1;
            display: flex;
            align-items: center;
            gap: 12px;
            min-width: 0;
        }

        .carousel-arrow-btn {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #d7d8dc;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            cursor: pointer;
            transition: all 0.2s;
            flex-shrink: 0;
        }

        .carousel-arrow-btn:hover {
            background-color: var(--brand-purple);
            transform: scale(1.08);
        }

        .carousel-arrow-btn svg {
            width: 14px;
            height: 14px;
            stroke-width: 2.8;
        }

        .chart-container {
            flex: 1;
            height: 250px;
            position: relative;
            min-width: 0;
        }

        .activity-side-stats {
            flex: 0 0 140px;
            display: flex;
            flex-direction: column;
            gap: 16px;
            justify-content: center;
        }

        .side-stat-box {
            background-color: #ffffff;
            border: 1.5px solid var(--brand-border-card);
            border-radius: 14px;
            padding: 14px 18px;
            display: flex;
            flex-direction: column;
            gap: 4px;
            box-shadow: 0 2px 10px rgba(100, 60, 150, 0.04);
        }

        .side-stat-title {
            font-size: 0.92rem;
            font-weight: 700;
            color: #1f1b26;
        }

        .side-stat-number {
            font-size: 2.1rem;
            font-weight: 800;
            color: #1f1b26;
            letter-spacing: -0.02em;
            line-height: 1.1;
        }

        /* ROW 3: DROPDOWN BUTTON */
        .filter-row {
            display: flex;
            align-items: center;
        }

        .campaign-filter-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background-color: #ffffff;
            border: 1.5px solid #dcd1ed;
            border-radius: 12px;
            padding: 10px 18px;
            font-size: 0.95rem;
            font-weight: 700;
            color: #1f1b26;
            cursor: pointer;
            box-shadow: 0 3px 10px rgba(100, 60, 150, 0.06);
            transition: all 0.2s ease;
        }

        .campaign-filter-btn:hover {
            background-color: #fbf9fd;
            border-color: var(--brand-purple);
        }

        .campaign-filter-btn svg {
            width: 12px;
            height: 12px;
            fill: currentColor;
        }

        /* ROW 4: KAMPANYE SAYA CARD */
        .my-campaigns-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            padding: 24px 28px;
            border: 1.5px solid var(--brand-border-card);
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.06);
            display: flex;
            flex-direction: column;
        }

        .campaign-item-block {
            display: flex;
            flex-direction: column;
            gap: 10px;
            padding: 12px 0;
        }

        .campaign-item-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }

        .campaign-item-name {
            font-size: 0.98rem;
            font-weight: 800;
            color: #1f1b26;
        }

        .campaign-badge-duration {
            background-color: var(--accent-badge-bg);
            color: var(--accent-badge-text);
            font-size: 0.78rem;
            font-weight: 700;
            padding: 4px 12px;
            border-radius: 6px;
            border: 1px solid #ddd5eb;
            flex-shrink: 0;
        }

        .campaign-track-wrap {
            width: 100%;
            height: 9px;
            background-color: #ece5f6;
            border-radius: 9999px;
            overflow: hidden;
        }

        .campaign-track-fill {
            height: 100%;
            background-color: var(--brand-purple-bar);
            border-radius: 9999px;
            transition: width 1s ease-in-out;
        }

        .campaign-progress-meta {
            font-size: 0.88rem;
            font-weight: 500;
            color: #6e727e;
        }

        .campaign-progress-meta .percent-highlight {
            font-weight: 700;
            color: var(--brand-purple-bar);
            margin-right: 2px;
        }

        .campaign-divider {
            height: 1.5px;
            background-color: #ede6f5;
            margin: 12px 0;
        }

        .campaign-footer-action {
            display: flex;
            justify-content: flex-end;
            padding-top: 14px;
        }

        .see-more-link {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-size: 0.95rem;
            font-weight: 700;
            color: #6d3ca1;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .see-more-link:hover {
            color: #522d86;
            transform: translateX(3px);
        }

        .see-more-link svg {
            width: 16px;
            height: 16px;
            stroke-width: 2.5;
        }

        /* ================= LOGOUT MODAL ================= */
        .logout-modal-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(30, 20, 50, 0.45);
            backdrop-filter: blur(2px);
            -webkit-backdrop-filter: blur(2px);
            z-index: 99999;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.25s ease, visibility 0.25s ease;
        }

        .logout-modal-backdrop.show {
            opacity: 1;
            visibility: visible;
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
            width: 48px;
            height: 48px;
            object-fit: contain;
            display: block;
        }

        .logout-modal-logo-text {
            font-size: 1.55rem;
            font-weight: 800;
            letter-spacing: -0.025em;
            background: linear-gradient(90deg, #502b8d 0%, #855cb8 50%, #e2c044 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            line-height: 1.2;
        }

        .logout-modal-title {
            font-size: 1.7rem;
            font-weight: 800;
            color: #1f1b26;
            margin-bottom: 30px;
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

        /* ----------------- RESPONSIVE ----------------- */
        @media (max-width: 1100px) {
            .metrics-row {
                grid-template-columns: 1fr;
            }
            .activity-body {
                flex-direction: column;
            }
            .activity-side-stats {
                flex-direction: row;
                flex: none;
                width: 100%;
            }
            .side-stat-box {
                flex: 1;
            }
        }

        @media (max-width: 820px) {
            body {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                max-width: 100%;
                height: auto;
                min-height: auto;
                position: relative;
            }
            .topbar {
                padding: 0 20px;
            }
            .content-area {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

    <!-- ---------------- SIDEBAR ---------------- -->
    <aside class="sidebar">
        <!-- Brand Logo & Wordmark -->
        <a href="{{ route('operator.dashboard') }}" class="sidebar-brand">
            <div class="brand-logo-badge" aria-hidden="true">
                <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
            </div>
            <div class="brand-text-block">
                <div class="brand-wordmark-wrap">
                    <span class="brand-wordmark">Benevo</span>
                    <span class="brand-yellow-dot" aria-hidden="true"></span>
                </div>
            </div>
        </a>

        <!-- Section: Menu Utama -->
        <div class="nav-section">
            <div class="nav-section-title">Menu Utama</div>
            <ul class="nav-list">
                <li>
                    <a href="{{ route('operator.dashboard') }}" class="nav-link active">
                        <!-- Dashboard Grid Icon (4 squares) -->
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
                    <a href="{{ route('manajemen-kampanye') }}" class="nav-link">
                        <!-- Manajemen Kampanye / Megaphone Icon -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 11l18-5v12L3 14v-3z"/>
                            <path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/>
                        </svg>
                        Manajemen Kampanye
                    </a>
                </li>
                <li>
                    <a href="{{ route('donatur') }}" class="nav-link">
                        <!-- Pemasukan Dana Donasi / Receipt Document Icon -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                            <polyline points="14 2 14 8 20 8"/>
                            <line x1="16" y1="13" x2="8" y2="13"/>
                            <line x1="16" y1="17" x2="8" y2="17"/>
                            <line x1="10" y1="9" x2="8" y2="9"/>
                        </svg>
                        Pemasukan Dana Donasi
                    </a>
                </li>
                <li>
                    <a href="{{ route('catatan-pengeluaran-donasi') }}" class="nav-link">
                        <!-- Catatan Pengeluaran Donasi / Clipboard Note Icon -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"/>
                            <rect x="8" y="2" width="8" height="4" rx="1" ry="1"/>
                            <path d="M12 11h4"/>
                            <path d="M12 16h4"/>
                            <path d="M8 11h.01"/>
                            <path d="M8 16h.01"/>
                        </svg>
                        Catatan Pengeluaran Donasi
                    </a>
                </li>
                <li>
                    <a href="{{ route('rekapitulasi-dana') }}" class="nav-link">
                        <!-- Rekapitulasi Dana / Wallet Icon -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/>
                            <path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/>
                            <path d="M18 12a2 2 0 0 0 0 4h4v-4z"/>
                        </svg>
                        Rekapitulasi Dana
                    </a>
                </li>
            </ul>
        </div>

        <!-- Sidebar Bottom: Log out -->
        <div class="sidebar-footer">
            <button type="button" class="logout-btn" onclick="openLogoutModal()" aria-label="Log out">
                <!-- Logout Icon -->
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
                        <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
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
                <div class="profile-pill">
                    <!-- Illustrated Avatar -->
                    <svg class="profile-avatar" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="18" cy="18" r="18" fill="#e9dbcb"/>
                        <path d="M18 19c3.31 0 6-2.69 6-6s-2.69-6-6-6-6 2.69-6 6 2.69 6 6 6z" fill="#3b2b23"/>
                        <circle cx="18" cy="14" r="4.2" fill="#eac6a6"/>
                        <path d="M14 11.5c1-1 3-1.5 4-1.5s3 .5 4 1.5c0-1.5-1.5-2.5-4-2.5s-4 1-4 2.5z" fill="#2b1f19"/>
                        <path d="M7.5 32c1.8-6 5.5-8 10.5-8s8.7 2 10.5 8" fill="#588157"/>
                        <path d="M15.5 24l2.5 3 2.5-3" stroke="#ffffff" stroke-width="1.2"/>
                    </svg>
                    <div class="profile-info">
                        <span class="profile-name">Harry Vaughan</span>
                        <span class="profile-role">Admin</span>
                    </div>
                </div>
            </div>
        </header>

        <!-- Page Main Content -->
        <main class="content-area">
            <h1 class="page-title">Dashboard</h1>

            <!-- ROW 1: 3 METRIC CARDS -->
            <div class="metrics-row">
                <!-- Card 1 -->
                <div class="metric-card">
                    <div class="metric-label">Kampanye Aktif</div>
                    <div class="metric-value">5</div>
                </div>
                <!-- Card 2 -->
                <div class="metric-card">
                    <div class="metric-label">Donasi hari ini</div>
                    <div class="metric-value">Rp 9.596.221</div>
                </div>
                <!-- Card 3 -->
                <div class="metric-card">
                    <div class="metric-label">Dana Terkumpul</div>
                    <div class="metric-value">Rp 26.761.604</div>
                </div>
            </div>

            <!-- ROW 2: AKTIVITAS SELURUH KAMPANYE -->
            <div class="activity-card">
                <div class="activity-header">
                    <h2 class="activity-title">Aktivitas seluruh Kampanye</h2>
                    <div class="activity-legend">
                        <div class="legend-item">
                            <span class="legend-dot yellow"></span>
                            <span>Terkumpul</span>
                        </div>
                        <div class="legend-item">
                            <span class="legend-dot purple"></span>
                            <span>Tersalurkan</span>
                        </div>
                    </div>
                </div>

                <div class="activity-body">
                    <!-- Dual Bar Chart with arrows -->
                    <div class="chart-carousel-wrapper">
                        <button class="carousel-arrow-btn" type="button" aria-label="Sebelumnya">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="15 18 9 12 15 6"></polyline>
                            </svg>
                        </button>

                        <div class="chart-container">
                            <canvas id="campaignActivityChart"></canvas>
                        </div>

                        <button class="carousel-arrow-btn" type="button" aria-label="Selanjutnya">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="9 18 15 12 9 6"></polyline>
                            </svg>
                        </button>
                    </div>

                    <!-- Right side stats: Target & Durasi -->
                    <div class="activity-side-stats">
                        <div class="side-stat-box">
                            <span class="side-stat-title">Target</span>
                            <span class="side-stat-number">78%</span>
                        </div>
                        <div class="side-stat-box">
                            <span class="side-stat-title">Durasi</span>
                            <span class="side-stat-number">30 d</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ROW 3: DROPDOWN BUTTON -->
            <div class="filter-row">
                <button type="button" class="campaign-filter-btn">
                    <span>Kampanye Saya</span>
                    <svg viewBox="0 0 24 24">
                        <path d="M7 10l5 5 5-5z"/>
                    </svg>
                </button>
            </div>

            <!-- ROW 4: KAMPANYE SAYA CARD -->
            <div class="my-campaigns-card">
                <!-- Item 1 -->
                <div class="campaign-item-block">
                    <div class="campaign-item-top">
                        <span class="campaign-item-name">Bantu Korban Banjir Bandang Fontaine</span>
                        <span class="campaign-badge-duration">4 hari</span>
                    </div>
                    <div class="campaign-track-wrap">
                        <div class="campaign-track-fill" style="width: 60%;"></div>
                    </div>
                    <div class="campaign-progress-meta">
                        <span class="percent-highlight">60%</span> dari 65.000.000
                    </div>
                </div>

                <div class="campaign-divider"></div>

                <!-- Item 2 -->
                <div class="campaign-item-block">
                    <div class="campaign-item-top">
                        <span class="campaign-item-name">Sumbangan Berkah Panti Asuhan Fathul</span>
                        <span class="campaign-badge-duration">4 hari</span>
                    </div>
                    <div class="campaign-track-wrap">
                        <div class="campaign-track-fill" style="width: 87%;"></div>
                    </div>
                    <div class="campaign-progress-meta">
                        <span class="percent-highlight">87%</span> dari 50.000.000
                    </div>
                </div>

                <div class="campaign-divider"></div>

                <!-- Footer link -->
                <div class="campaign-footer-action">
                    <a href="{{ route('manajemen-kampanye') }}" class="see-more-link">
                        <span>Lihat Selengkapnya</span>
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="5" y1="12" x2="19" y2="12"></line>
                            <polyline points="12 5 19 12 12 19"></polyline>
                        </svg>
                    </a>
                </div>
            </div>
        </main>
    </div>

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

    <!-- Chart Configuration Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('campaignActivityChart').getContext('2d');

            const labels = ['Sen, 12 Okt', 'Sel, 13 Okt', 'Wed, 14 Okt', 'Thu, 15 Okt', 'Fri, 16 Okt', 'Sat, 17 Okt', 'Sun, 17 Okt'];
            
            // Tersalurkan: Purple bar
            const tersalurkanData = [35, 68, 48, 44, 53, 55, 52];
            // Terkumpul: Yellow bar
            const terkumpulData = [92, 52, 18, 63, 8, 46, 36];

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Tersalurkan',
                            data: tersalurkanData,
                            backgroundColor: '#583296',
                            borderRadius: 3,
                            borderSkipped: false,
                            barPercentage: 0.72,
                            categoryPercentage: 0.62
                        },
                        {
                            label: 'Terkumpul',
                            data: terkumpulData,
                            backgroundColor: '#fae060',
                            borderRadius: 3,
                            borderSkipped: false,
                            barPercentage: 0.72,
                            categoryPercentage: 0.62
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    animation: {
                        duration: 1000,
                        easing: 'easeOutQuart'
                    },
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            backgroundColor: '#2e144e',
                            titleFont: { family: 'Plus Jakarta Sans', size: 12, weight: '700' },
                            bodyFont: { family: 'Plus Jakarta Sans', size: 12, weight: '500' },
                            padding: 10,
                            cornerRadius: 8,
                            callbacks: {
                                label: function(context) {
                                    return ' ' + context.dataset.label + ': ' + context.raw + '%';
                                }
                            }
                        }
                    },
                    scales: {
                        x: {
                            grid: {
                                display: true,
                                color: '#ede7f4',
                                drawTicks: false
                            },
                            ticks: {
                                color: '#2a2533',
                                font: {
                                    family: 'Plus Jakarta Sans',
                                    size: 11,
                                    weight: '600'
                                },
                                padding: 8
                            },
                            border: {
                                color: '#ede7f4'
                            }
                        },
                        y: {
                            display: true,
                            min: 0,
                            max: 100,
                            grid: {
                                color: '#ede7f4',
                                drawTicks: false
                            },
                            ticks: {
                                display: false
                            },
                            border: {
                                display: false
                            }
                        }
                    }
                }
            });
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

        document.addEventListener('click', function(e) {
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
</body>
</html>
