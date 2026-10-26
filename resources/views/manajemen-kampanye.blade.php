<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Manajemen Kampanye</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-page: #f2ecfa;
            --bg-sidebar: #ffffff;
            --bg-card: #ffffff;
            --brand-purple: #855cb8;
            --brand-purple-dark: #2d164d;
            --brand-purple-heading: #2d174e;
            --brand-text-dark: #1f1b26;
            --brand-text-muted: #6e727e;
            --brand-border: #ede6f5;
            --accent-green-bg: #daf7e5;
            --accent-green-text: #199447;
            --accent-peach-bg: #fde8db;
            --accent-peach-text: #cb5d2c;
            --accent-gray-bg: #ebe5f5;
            --accent-gray-text: #6c5490;
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

        /* ========== SIDEBAR ========== */
        .sidebar {
            width: 275px;
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
        }

        .brand-logo-badge {
            width: 38px;
            height: 38px;
            background: transparent;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: none;
            flex-shrink: 0;
            overflow: hidden;
        }

        .brand-logo-badge svg {
            width: 100%;
            height: 100%;
            display: block;
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
            font-size: 2.1rem;
            font-weight: 800;
            letter-spacing: -0.06em;
            line-height: 0.9;
            color: #7a4fb2;
        }

        .brand-gradient {
            background: linear-gradient(90deg, #6d3ca1 0%, #8e6bc6 40%, #c9a227 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .brand-yellow-dot {
            position: absolute;
            right: -8px;
            top: 5px;
            width: 9px;
            height: 9px;
            background-color: #f4d566;
            border-radius: 50%;
        }

        .brand-platform-sub {
            font-size: 0.62rem;
            font-weight: 800;
            letter-spacing: 0.12em;
            color: #7c5a9f;
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
        }

        .mode-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .mode-dot {
            width: 10px;
            height: 10px;
            background-color: #6a3ab2;
            border-radius: 50%;
        }

        .mode-title {
            font-size: 0.88rem;
            font-weight: 700;
            color: #3b2260;
            line-height: 1.2;
        }

        .mode-sub {
            font-size: 0.76rem;
            color: #7d6b97;
            font-weight: 500;
        }

        .mode-badge {
            background-color: var(--accent-peach-bg);
            color: var(--accent-peach-text);
            font-size: 0.72rem;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 6px;
        }

        /* Navigation */
        .nav-section {
            margin-top: 28px;
        }

        .nav-section-title {
            font-size: 0.85rem;
            font-weight: 600;
            color: #747783;
            margin-bottom: 12px;
            padding-left: 8px;
        }

        .nav-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 0.92rem;
            font-weight: 600;
            color: #555966;
            transition: all 0.2s ease;
        }

        .nav-link svg {
            width: 20px;
            height: 20px;
            fill: none;
            stroke: currentColor;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
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
        }

        /* ========== MAIN WRAPPER ========== */
        .main-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-width: 0;
            overflow-x: hidden;
        }

        /* Topbar */
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
            background-color: #fbf9fd;
            border: 1px solid #ece4f5;
            border-radius: 9999px;
            padding: 0 16px 0 40px;
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

        .search-input::placeholder { color: #9fa3af; }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 16px;
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
            white-space: nowrap;
        }

        .date-picker-btn svg { width: 16px; height: 16px; color: #7957a7; }

        .icon-action-btn {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            background: #ffffff;
            border: 1px solid #e7dff2;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #555866;
            position: relative;
            transition: all 0.15s;
        }

        .icon-action-btn:hover { background-color: #faf7fd; color: var(--brand-purple); }
        .icon-action-btn svg { width: 18px; height: 18px; }

        .notif-badge-dot {
            position: absolute;
            top: 7px;
            right: 7px;
            width: 7px;
            height: 7px;
            background-color: #e24b42;
            border-radius: 50%;
            border: 1.5px solid #ffffff;
        }

        .help-action-btn {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            background: #8b5fc2;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #ffffff;
            font-size: 0.95rem;
            font-weight: 700;
        }

        .profile-pill {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-left: 6px;
            cursor: pointer;
        }

        .profile-avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background-color: #dfd2f5;
            object-fit: cover;
            border: 2px solid #ede4f8;
        }

        .profile-info { display: flex; flex-direction: column; }

        .profile-name {
            font-size: 0.86rem;
            font-weight: 700;
            color: #232227;
            line-height: 1.2;
        }

        .profile-role {
            font-size: 0.72rem;
            font-weight: 500;
            color: #797c88;
        }

        /* ========== CONTENT ========== */
        .content-area {
            padding: 30px 36px 40px 36px;
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .page-title {
            font-size: 2.1rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.025em;
        }

        /* ========== STAT CARDS ROW ========== */
        .stat-cards-row {
            display: flex;
            gap: 16px;
        }

        .stat-card {
            background-color: var(--bg-card);
            border-radius: 16px;
            padding: 20px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            min-width: 200px;
            box-shadow: 0 2px 12px rgba(100, 60, 150, 0.06);
        }

        .stat-card-content {}

        .stat-card-label {
            font-size: 0.9rem;
            font-weight: 600;
            color: #5c606d;
            margin-bottom: 6px;
        }

        .stat-card-value {
            font-size: 2.2rem;
            font-weight: 800;
            color: var(--brand-text-dark);
            letter-spacing: -0.03em;
            line-height: 1;
        }

        .stat-card-arrow {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            border: 2px solid #e2d8f5;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--brand-purple);
            flex-shrink: 0;
            cursor: pointer;
            transition: all 0.15s;
        }

        .stat-card-arrow:hover {
            background-color: var(--brand-purple);
            border-color: var(--brand-purple);
            color: #fff;
        }

        .stat-card-arrow svg {
            width: 16px;
            height: 16px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2.5;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .stat-card-purple {
            background-color: #d8caf2;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .stat-card-purple:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(133, 92, 184, 0.22);
            background-color: #d1c1ee;
        }

        /* ========== FILTER ROW ========== */
        .filter-row {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .filter-select-wrap {
            position: relative;
            display: inline-flex;
            align-items: center;
        }

        .filter-select {
            appearance: none;
            -webkit-appearance: none;
            background-color: #ffffff;
            border: 1.5px solid #ddd5f0;
            border-radius: 8px;
            padding: 9px 34px 9px 14px;
            font-size: 0.85rem;
            font-weight: 600;
            color: #3d3660;
            cursor: pointer;
            outline: none;
            transition: border-color 0.15s;
            font-family: inherit;
        }

        .filter-select:focus {
            border-color: var(--brand-purple);
        }

        .filter-chevron {
            position: absolute;
            right: 10px;
            pointer-events: none;
            color: #7a62a2;
        }

        .filter-chevron svg {
            width: 14px;
            height: 14px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2.5;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        /* ========== TABLE CARD ========== */
        .table-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            padding: 28px 30px 24px 30px;
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.07);
        }

        .table-card-title {
            font-size: 1.55rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.02em;
            margin-bottom: 22px;
        }

        /* Table */
        .kampanye-table {
            width: 100%;
            border-collapse: collapse;
        }

        .kampanye-table thead tr {
            background-color: #f0ebfc;
        }

        .kampanye-table thead th {
            padding: 13px 16px;
            text-align: left;
            font-size: 0.85rem;
            font-weight: 700;
            color: #4a3472;
            white-space: nowrap;
        }

        .kampanye-table thead th:first-child {
            border-radius: 10px 0 0 10px;
            width: 60px;
        }

        .kampanye-table thead th:last-child {
            border-radius: 0 10px 10px 0;
            text-align: center;
        }

        .kampanye-table tbody tr {
            border-bottom: 1px solid #f2ecfb;
            transition: background 0.15s;
        }

        .kampanye-table tbody tr:hover {
            background-color: #faf7ff;
        }

        .kampanye-table tbody tr:last-child {
            border-bottom: none;
        }

        .kampanye-table tbody td {
            padding: 18px 16px;
            font-size: 0.88rem;
            color: #2e2d35;
            vertical-align: middle;
        }

        .td-id {
            font-weight: 700;
            color: #5a4a80;
            font-size: 0.85rem;
        }

        .td-kampanye-name {
            font-weight: 600;
            color: #1f1b26;
            max-width: 200px;
            line-height: 1.4;
        }

        /* Dana Terkumpul column */
        .dana-cell {}

        .dana-amount {
            font-size: 0.85rem;
            font-weight: 600;
            color: #2e2d35;
            margin-bottom: 6px;
        }

        .progress-bar-wrap {
            width: 100%;
            height: 7px;
            background-color: #e8e0f5;
            border-radius: 99px;
            overflow: hidden;
        }

        .progress-bar-fill {
            height: 100%;
            border-radius: 99px;
            background-color: var(--brand-purple);
            transition: width 0.4s ease;
        }

        .progress-bar-fill.over-target {
            background-color: #3b1fa8;
        }

        .progress-pct {
            font-size: 0.72rem;
            color: #8e879e;
            font-weight: 500;
            margin-top: 3px;
        }

        .td-donatur {
            font-weight: 600;
            color: #2e2d35;
        }

        .td-sisa-waktu {
            font-weight: 600;
            color: #2e2d35;
            white-space: nowrap;
        }

        /* Status badges */
        .status-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 5px 14px;
            border-radius: 99px;
            font-size: 0.8rem;
            font-weight: 700;
        }

        .status-aktif {
            background-color: #daf7e5;
            color: #1a9448;
        }

        .status-beku {
            background-color: #e8e0f5;
            color: #7257b0;
        }

        .status-selesai {
            background-color: #fde8db;
            color: #c85a28;
        }

        /* td status center */
        .td-status {
            text-align: center;
        }

        /* ========== TABLE FOOTER ========== */
        .table-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 24px;
            padding-top: 18px;
            border-top: 1px solid #f0eafa;
        }

        .table-info {
            font-size: 0.85rem;
            color: #6e727e;
        }

        .table-info strong {
            color: #2e2d35;
            font-weight: 700;
        }

        /* Pagination */
        .pagination {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .page-btn {
            width: 34px;
            height: 34px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.85rem;
            font-weight: 600;
            border: 1.5px solid #e0d8f0;
            background: #ffffff;
            color: #555776;
            cursor: pointer;
            transition: all 0.15s;
        }

        .page-btn svg {
            width: 15px;
            height: 15px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2.5;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .page-btn:hover {
            background-color: #f3ecfc;
            border-color: var(--brand-purple);
            color: var(--brand-purple);
        }

        .page-btn.active {
            background-color: var(--brand-purple);
            border-color: var(--brand-purple);
            color: #ffffff;
        }

        /* SVG profile placeholder */
        .avatar-svg {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background: #d9cdf0;
            border: 2px solid #ede4f8;
            overflow: hidden;
            flex-shrink: 0;
        }
    
        /* ========== LOGOUT SIDEBAR BUTTON & MODAL POPUP ========== */
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
            stroke: #1f1f1f;
            flex-shrink: 0;
            transition: stroke 0.2s;
        }

        .logout-btn span {
            font-size: 0.95rem;
            font-weight: 700;
            color: #db6e6e;
            transition: color 0.2s;
        }

        .logout-btn:hover svg {
            stroke: #d33838;
        }

        .logout-btn:hover span {
            color: #d33838;
        }

        /* Modal Backdrop */
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
    
        .sidebar::-webkit-scrollbar {
            width: 4px;
        }
        .sidebar::-webkit-scrollbar-thumb {
            background: #e5daf3;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<!-- ========== SIDEBAR ========== -->
<aside class="sidebar">
    <!-- Brand Logo -->
    <a href="{{ route('dashboard') }}" class="sidebar-brand">
        <div class="brand-logo-badge">
            <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
        </div>
        <div class="brand-text-block">
            <div class="brand-wordmark-wrap">
                <span class="brand-wordmark brand-gradient">Benevo</span>
                <span class="brand-yellow-dot"></span>
            </div>
            <span class="brand-platform-sub">CMS PLATFORM</span>
        </div>
    </a>

    <!-- Modus Operasi -->
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

    <!-- Menu Utama -->
    <nav class="nav-section">
        <div class="nav-section-title">Menu Utama</div>
        <ul class="nav-list">
            <li>
                <a href="{{ route('dashboard') }}" class="nav-link">
                    <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
                    Dashboard
                </a>
            </li>
            <li>
                <a href="{{ route('rekapitulasi-dana') }}" class="nav-link">
                    <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/></svg>
                    Rekaptulasi Dana
                </a>
            </li>
            <li>
                <a href="{{ route('manajemen-kampanye') }}" class="nav-link active">
                    <svg viewBox="0 0 24 24"><path d="M22 12h-4l-3 9L9 3l-3 9H2"/></svg>
                    Manajemen Kampanye
                </a>
            </li>
            <li>
                <a href="{{ route('donatur') }}" class="nav-link">
                    <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                    Donatur
                </a>
            </li>
        </ul>
    </nav>

    <!-- Admin Section -->
    <nav class="nav-section">
        <div class="nav-section-title">Admin</div>
        <ul class="nav-list">
            <li>
                <a href="{{ route('kelola-akun-operator') }}" class="nav-link">
                    <svg viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/><circle cx="19" cy="8" r="2" fill="currentColor" stroke="none" opacity="0.5"/><path d="M22 13.5c-1-1-2.5-1.5-3-1.5" stroke-width="1.5"/></svg>
                    Kelola Akun Operator
                </a>
            </li>
        </ul>
    </nav>

        <!-- Sidebar Bottom: Logout Button -->
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

<!-- ========== MAIN WRAPPER ========== -->
<div class="main-wrapper">

    <!-- Topbar -->
    <header class="topbar">
        <div class="search-container">
            <span class="search-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
                </svg>
            </span>
            <input type="text" class="search-input" placeholder="Cari Apapun...">
        </div>

        <div class="topbar-right">
            <button class="date-picker-btn">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/>
                </svg>
                30 Hari Terakhir
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:13px;height:13px;margin-left:2px;">
                    <polyline points="6 9 12 15 18 9"/>
                </svg>
            </button>

            <button class="icon-action-btn">
                <span class="notif-badge-dot"></span>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                </svg>
            </button>

            <button class="help-action-btn">?</button>

            <div class="profile-pill">
                <svg class="avatar-svg" viewBox="0 0 38 38" xmlns="http://www.w3.org/2000/svg">
                    <rect width="38" height="38" rx="19" fill="#d9cdf0"/>
                    <circle cx="19" cy="15" r="7" fill="#a68ed4"/>
                    <ellipse cx="19" cy="34" rx="11" ry="9" fill="#a68ed4"/>
                </svg>
                <div class="profile-info">
                    <span class="profile-name">Harry Vaughan</span>
                    <span class="profile-role">Admin</span>
                </div>
            </div>
        </div>
    </header>

    <!-- Content -->
    <main class="content-area">
        <h1 class="page-title">Manajemen Kampanye</h1>

        <!-- Stat Cards -->
        <div class="stat-cards-row">
            <div class="stat-card">
                <div class="stat-card-content">
                    <div class="stat-card-label">Total Berjalan</div>
                    <div class="stat-card-value">114</div>
                </div>
                <div class="stat-card-arrow">
                    <svg viewBox="0 0 24 24"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-card-content">
                    <div class="stat-card-label">Dibekukan</div>
                    <div class="stat-card-value">3</div>
                </div>
                <div class="stat-card-arrow">
                    <svg viewBox="0 0 24 24"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-card-content">
                    <div class="stat-card-label">Mencapai Target</div>
                    <div class="stat-card-value">1</div>
                </div>
                <div class="stat-card-arrow">
                    <svg viewBox="0 0 24 24"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
                </div>
            </div>

            <a href="{{ route('pengajuan-kampanye') }}" class="stat-card stat-card-purple" style="text-decoration: none;">
                <div class="stat-card-content">
                    <div class="stat-card-label" style="color: #4b366a;">Pengajuan Kampanye</div>
                    <div class="stat-card-value" style="color: #211b2d;">4</div>
                </div>
                <div class="stat-card-arrow" style="border-color: #bfaee0; color: #5a388f;">
                    <svg viewBox="0 0 24 24"><line x1="5" y1="12" x2="19" y2="12"/><polyline points="12 5 19 12 12 19"/></svg>
                </div>
            </a>
        </div>

        <!-- Filters -->
        <div class="filter-row">
            <div class="filter-select-wrap">
                <select class="filter-select">
                    <option>Semua Status</option>
                    <option>Aktif</option>
                    <option>Beku</option>
                    <option>Selesai</option>
                </select>
                <span class="filter-chevron">
                    <svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg>
                </span>
            </div>
            <div class="filter-select-wrap">
                <select class="filter-select">
                    <option>Kategori</option>
                    <option>Bencana Alam</option>
                    <option>Lingkungan</option>
                    <option>Sosial</option>
                    <option>Pendidikan</option>
                </select>
                <span class="filter-chevron">
                    <svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg>
                </span>
            </div>
        </div>

        <!-- Table Card -->
        <div class="table-card">
            <div class="table-card-title">Kampanye</div>

            <table class="kampanye-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Kampanye</th>
                        <th>Dana Terkumpul</th>
                        <th>Donatur</th>
                        <th>Sisa Waktu</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Row 1 -->
                    <tr>
                        <td class="td-id">K01</td>
                        <td class="td-kampanye-name">Bantuan Bencana Gempa NTT</td>
                        <td class="dana-cell">
                            <div class="dana-amount">Rp 156,7 jt / Rp 200jt</div>
                            <div class="progress-bar-wrap">
                                <div class="progress-bar-fill" style="width: 78%;"></div>
                            </div>
                            <div class="progress-pct">78%</div>
                        </td>
                        <td class="td-donatur">312</td>
                        <td class="td-sisa-waktu">12 hari</td>
                        <td class="td-status"><span class="status-badge status-aktif">Aktif</span></td>
                    </tr>
                    <!-- Row 2 -->
                    <tr>
                        <td class="td-id">K02</td>
                        <td class="td-kampanye-name">Darurat Karhutla Kalimantan</td>
                        <td class="dana-cell">
                            <div class="dana-amount">Rp 97,7 jt / Rp 150jt</div>
                            <div class="progress-bar-wrap">
                                <div class="progress-bar-fill" style="width: 65%;"></div>
                            </div>
                            <div class="progress-pct">65%</div>
                        </td>
                        <td class="td-donatur">187</td>
                        <td class="td-sisa-waktu">6 hari</td>
                        <td class="td-status"><span class="status-badge status-aktif">Aktif</span></td>
                    </tr>
                    <!-- Row 3 -->
                    <tr>
                        <td class="td-id">K03</td>
                        <td class="td-kampanye-name">Bantuan Keselamatan Korban Banjir Aceh</td>
                        <td class="dana-cell">
                            <div class="dana-amount">Rp 44,8 jt / Rp 50jt</div>
                            <div class="progress-bar-wrap">
                                <div class="progress-bar-fill" style="width: 90%;"></div>
                            </div>
                            <div class="progress-pct">90%</div>
                        </td>
                        <td class="td-donatur">241</td>
                        <td class="td-sisa-waktu">1 hari</td>
                        <td class="td-status"><span class="status-badge status-beku">Beku</span></td>
                    </tr>
                    <!-- Row 4 -->
                    <tr>
                        <td class="td-id">K04</td>
                        <td class="td-kampanye-name">Sedekah untuk Panti Asuhan&nbsp; Nurani</td>
                        <td class="dana-cell">
                            <div class="dana-amount">Rp 161,3jt / Rp 120jt</div>
                            <div class="progress-bar-wrap">
                                <div class="progress-bar-fill over-target" style="width: 100%;"></div>
                            </div>
                            <div class="progress-pct">120%</div>
                        </td>
                        <td class="td-donatur">349</td>
                        <td class="td-sisa-waktu">2 hari</td>
                        <td class="td-status"><span class="status-badge status-aktif">Aktif</span></td>
                    </tr>
                    <!-- Row 5 -->
                    <tr>
                        <td class="td-id">K05</td>
                        <td class="td-kampanye-name">Penanaman 250.000 Pohon di Sumatra</td>
                        <td class="dana-cell">
                            <div class="dana-amount">Rp 257,6 jt / Rp 500jt</div>
                            <div class="progress-bar-wrap">
                                <div class="progress-bar-fill" style="width: 39%;"></div>
                            </div>
                            <div class="progress-pct">39%</div>
                        </td>
                        <td class="td-donatur">599</td>
                        <td class="td-sisa-waktu">4 hari</td>
                        <td class="td-status"><span class="status-badge status-aktif">Aktif</span></td>
                    </tr>
                </tbody>
            </table>

            <!-- Table Footer -->
            <div class="table-footer">
                <div class="table-info">
                    Menampilkan <strong>5</strong> dari <strong>115</strong> Lainnya
                </div>
                <div class="pagination">
                    <button class="page-btn">
                        <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg>
                    </button>
                    <button class="page-btn active">1</button>
                    <button class="page-btn">
                        <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg>
                    </button>
                </div>
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

    <script>
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

