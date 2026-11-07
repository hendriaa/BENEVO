<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Catatan Pengeluaran Donasi</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-page: #f5f0fa;
            --bg-sidebar: #ffffff;
            --bg-card: #ffffff;
            --brand-purple: #855cb8;
            --brand-purple-dark: #2d164d;
            --brand-purple-header: #8b63c7;
            --brand-purple-cell: #dcd2ed;
            --brand-purple-cell2: #ede8f5;
            --brand-yellow: #f4d566;
            --brand-text-dark: #1f1b26;
            --brand-text-muted: #6e727e;
            --brand-border: #ede6f5;
            --brand-border-card: #e8dfef;
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
            gap: 22px;
        }

        .page-title {
            font-size: 2.15rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            letter-spacing: -0.025em;
        }

        /* Metric Card Pengeluaran */
        .pengeluaran-card {
            background-color: var(--bg-card);
            border-radius: 18px;
            padding: 22px 28px;
            border: 1.5px solid var(--brand-border-card);
            box-shadow: 0 4px 18px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
            gap: 8px;
            max-width: 360px;
        }

        .pengeluaran-label {
            font-size: 0.98rem;
            font-weight: 700;
            color: #1f1b26;
        }

        .pengeluaran-value {
            font-size: 2.2rem;
            font-weight: 800;
            color: #1f1b26;
            letter-spacing: -0.03em;
            line-height: 1.1;
        }

        /* Filter Button */
        .filter-row {
            display: flex;
            align-items: center;
        }

        .filter-dropdown-btn {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            background-color: #ffffff;
            border: 1.5px solid #dcd1ed;
            border-radius: 14px;
            padding: 10px 20px;
            font-size: 0.95rem;
            font-weight: 700;
            color: #1f1b26;
            cursor: pointer;
            box-shadow: 0 3px 10px rgba(100, 60, 150, 0.06);
            transition: all 0.2s;
        }

        .filter-dropdown-btn:hover {
            background-color: #fbf9fd;
            border-color: var(--brand-purple);
        }

        .filter-dropdown-btn svg {
            width: 12px;
            height: 12px;
            fill: currentColor;
        }

        /* Table Card */
        .table-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            border: 1.5px solid var(--brand-border-card);
            padding: 24px 28px;
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.06);
            overflow-x: auto;
        }

        .expenditure-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            text-align: left;
        }

        .expenditure-table th {
            padding: 14px 18px;
            font-size: 0.92rem;
            font-weight: 700;
            color: #272132;
            background-color: #c9b4e8;
            border: 1px solid #bba4db;
        }

        .expenditure-table th:first-child {
            border-top-left-radius: 12px;
        }

        .expenditure-table th:last-child {
            border-top-right-radius: 12px;
            text-align: center;
        }

        .expenditure-table td {
            padding: 16px 18px;
            font-size: 0.9rem;
            color: #1f1b26;
            vertical-align: middle;
            border: 1px solid #e5daf3;
        }

        .col-id {
            background-color: #dcd2ed;
            font-weight: 700;
            color: #2b1f3c;
            white-space: nowrap;
        }

        .col-time {
            background-color: #ede8f5;
            font-weight: 600;
            color: #272132;
            white-space: nowrap;
        }

        .col-time .sub-time {
            font-size: 0.8rem;
            color: #726b80;
            margin-top: 3px;
            font-weight: 500;
        }

        .col-campaign {
            font-weight: 600;
            color: #1f1b26;
            background-color: #ffffff;
        }

        .col-keterangan {
            font-weight: 500;
            color: #4b4556;
            background-color: #ffffff;
        }

        .col-nominal {
            font-weight: 700;
            color: #1f1b26;
            background-color: #ffffff;
            white-space: nowrap;
        }

        .col-bukti {
            text-align: center;
            background-color: #ffffff;
        }

        .link-bukti-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #2e1d4a;
            cursor: pointer;
            text-decoration: none;
            transition: transform 0.15s, color 0.15s;
        }

        .link-bukti-btn:hover {
            color: var(--brand-purple);
            transform: scale(1.15);
        }

        .link-bukti-btn svg {
            width: 20px;
            height: 20px;
        }

        /* Pagination */
        .table-pagination-row {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 8px;
            margin-top: 20px;
        }

        .pagination-btn {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background-color: #d7d8dc;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #555966;
            cursor: pointer;
            transition: all 0.15s;
        }

        .pagination-btn:hover {
            background-color: #c8c9ce;
        }

        .pagination-btn.active {
            background-color: #d7d8dc;
            font-weight: 800;
            border-radius: 8px;
            width: 32px;
            height: 32px;
            color: #2d164d;
        }

        .pagination-btn svg {
            width: 14px;
            height: 14px;
            stroke-width: 2.5;
        }

        /* Proof Modal */
        .proof-modal-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(30, 20, 50, 0.45);
            backdrop-filter: blur(2px);
            z-index: 99999;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            visibility: hidden;
            transition: all 0.25s ease;
        }

        .proof-modal-backdrop.show {
            opacity: 1;
            visibility: visible;
        }

        .proof-modal-card {
            background: #ffffff;
            width: 90%;
            max-width: 520px;
            border-radius: 20px;
            padding: 28px 30px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .proof-modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .proof-modal-title {
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
        }

        .proof-modal-close {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: #7b758a;
        }

        .proof-image-placeholder {
            width: 100%;
            height: 240px;
            border-radius: 12px;
            background: #eee8f7;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 10px;
            color: #583296;
            font-weight: 700;
            border: 2px dashed #bfaedc;
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
                    <a href="{{ route('operator.dashboard') }}" class="nav-link">
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
                        <!-- Pemasukan Dana Donasi -->
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
                    <a href="{{ route('catatan-pengeluaran-donasi') }}" class="nav-link active">
                        <!-- Catatan Pengeluaran Donasi (ACTIVE) -->
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
                        <!-- Rekapitulasi Dana -->
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
                <div class="profile-pill">
                    <svg class="profile-avatar" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="18" cy="18" r="18" fill="#e9dbcb"/>
                        <path d="M18 19c3.31 0 6-2.69 6-6s-2.69-6-6-6-6 2.69-6 6 2.69 6 6 6z" fill="#3b2b23"/>
                        <circle cx="18" cy="14" r="4.2" fill="#eac6a6"/>
                        <path d="M7.5 32c1.8-6 5.5-8 10.5-8s8.7 2 10.5 8" fill="#588157"/>
                    </svg>
                    <div class="profile-info">
                        <span class="profile-name">Van Gogh</span>
                        <span class="profile-role">Operator</span>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content Area -->
        <main class="content-area">
            <h1 class="page-title">Catatan Pengeluaran Donasi</h1>

            <!-- Metric Card Pengeluaran -->
            <div class="pengeluaran-card">
                <span class="pengeluaran-label">Pengeluaran</span>
                <span class="pengeluaran-value">Rp 56.000.000</span>
            </div>

            <!-- Filter Dropdown Button -->
            <div class="filter-row">
                <button type="button" class="filter-dropdown-btn">
                    <span>Semua Kampanye</span>
                    <svg viewBox="0 0 24 24">
                        <path d="M7 10l5 5 5-5z"/>
                    </svg>
                </button>
            </div>

            <!-- Table Card -->
            <div class="table-card">
                <table class="expenditure-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tanggal &amp; Waktu</th>
                            <th>Kampanye</th>
                            <th>Keterangan</th>
                            <th>Nominal</th>
                            <th>Bukti</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Row 1 -->
                        <tr>
                            <td class="col-id">CPD-2026 1016-10</td>
                            <td class="col-time">
                                <div>12 Sep 2026</div>
                                <div class="sub-time">09:30</div>
                            </td>
                            <td class="col-campaign">Bantu Korban Banjir Bandang Fontaine</td>
                            <td class="col-keterangan">Sembako, Peralatan Masak, Air Bersih</td>
                            <td class="col-nominal">- Rp 35.000.000</td>
                            <td class="col-bukti">
                                <a href="javascript:void(0)" class="link-bukti-btn" onclick="openProofModal('Kwitansi Pembelian Sembako & Air Bersih - Rp 35.000.000')" title="Lihat Bukti">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
                                        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
                                    </svg>
                                </a>
                            </td>
                        </tr>

                        <!-- Row 2 -->
                        <tr>
                            <td class="col-id">CPD-2026 1016-10</td>
                            <td class="col-time">
                                <div>21 Sep 2026</div>
                                <div class="sub-time">10:36</div>
                            </td>
                            <td class="col-campaign">Sumbangan Berkah Panti Asuhan Fathul</td>
                            <td class="col-keterangan">Sembako &amp; Pakaian Layak</td>
                            <td class="col-nominal">-Rp 10.000.000</td>
                            <td class="col-bukti">
                                <a href="javascript:void(0)" class="link-bukti-btn" onclick="openProofModal('Faktur Belanja Sembako & Pakaian - Rp 10.000.000')" title="Lihat Bukti">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
                                        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
                                    </svg>
                                </a>
                            </td>
                        </tr>

                        <!-- Row 3 -->
                        <tr>
                            <td class="col-id">CPD-2026 1016-10</td>
                            <td class="col-time">
                                <div>01 Okt 2026</div>
                                <div class="sub-time">12:57</div>
                            </td>
                            <td class="col-campaign">Penanaman 250.000 pohon di Sumatra</td>
                            <td class="col-keterangan">Alat Berkebun &amp; Bibit Pohon</td>
                            <td class="col-nominal">-Rp 20.000.000</td>
                            <td class="col-bukti">
                                <a href="javascript:void(0)" class="link-bukti-btn" onclick="openProofModal('Nota Pembelian Bibit Pohon & Alat - Rp 20.000.000')" title="Lihat Bukti">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
                                        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
                                    </svg>
                                </a>
                            </td>
                        </tr>

                        <!-- Row 4 -->
                        <tr>
                            <td class="col-id">CPD-2026 1016-10</td>
                            <td class="col-time">
                                <div>10 Okt 2026</div>
                                <div class="sub-time">09:42</div>
                            </td>
                            <td class="col-campaign">Pengecoran jalan desa purukan</td>
                            <td class="col-keterangan">Semen, Pasir &amp; Peralatan</td>
                            <td class="col-nominal">-Rp 25.000.000</td>
                            <td class="col-bukti">
                                <a href="javascript:void(0)" class="link-bukti-btn" onclick="openProofModal('Kwitansi Material Semen & Pasir - Rp 25.000.000')" title="Lihat Bukti">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
                                        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
                                    </svg>
                                </a>
                            </td>
                        </tr>

                        <!-- Row 5 -->
                        <tr>
                            <td class="col-id">CPD-2026 1016-10</td>
                            <td class="col-time">
                                <div>16 Okt 2026</div>
                                <div class="sub-time">13:40</div>
                            </td>
                            <td class="col-campaign">Beasiswa untuk anak -anak desa pelosok</td>
                            <td class="col-keterangan">Uang tunai, Peralatan Sekolah &amp; Alat Tulis</td>
                            <td class="col-nominal">-Rp 17.000.000</td>
                            <td class="col-bukti">
                                <a href="javascript:void(0)" class="link-bukti-btn" onclick="openProofModal('Tanda Terima Penyaluran Beasiswa - Rp 17.000.000')" title="Lihat Bukti">
                                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path>
                                        <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div class="table-pagination-row">
                    <button type="button" class="pagination-btn" aria-label="Sebelumnya">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="15 18 9 12 15 6"></polyline>
                        </svg>
                    </button>
                    <button type="button" class="pagination-btn active">1</button>
                    <button type="button" class="pagination-btn" aria-label="Selanjutnya">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="9 18 15 12 9 6"></polyline>
                        </svg>
                    </button>
                </div>
            </div>
        </main>
    </div>

    <!-- PROOF MODAL POPUP -->
    <div class="proof-modal-backdrop" id="proofModal">
        <div class="proof-modal-card">
            <div class="proof-modal-header">
                <h3 class="proof-modal-title" id="proofModalTitle">Bukti Pengeluaran Donasi</h3>
                <button type="button" class="proof-modal-close" onclick="closeProofModal()">&times;</button>
            </div>
            <div class="proof-image-placeholder">
                <svg viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
                    <polyline points="14 2 14 8 20 8"></polyline>
                    <line x1="16" y1="13" x2="8" y2="13"></line>
                    <line x1="16" y1="17" x2="8" y2="17"></line>
                </svg>
                <span id="proofModalDesc">Berkas Bukti Pembayaran Resmi</span>
            </div>
            <button type="button" class="filter-dropdown-btn" style="justify-content: center; width: 100%;" onclick="closeProofModal()">Tutup</button>
        </div>
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

        function openProofModal(title) {
            document.getElementById('proofModalTitle').textContent = title;
            document.getElementById('proofModal').classList.add('show');
        }

        function closeProofModal() {
            document.getElementById('proofModal').classList.remove('show');
        }

        document.addEventListener('click', function(e) {
            const logoutModal = document.getElementById('logoutModal');
            if (e.target === logoutModal) {
                closeLogoutModal();
            }
            const proofModal = document.getElementById('proofModal');
            if (e.target === proofModal) {
                closeProofModal();
            }
        });

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeLogoutModal();
                closeProofModal();
            }
        });
    </script>
</body>
</html>
