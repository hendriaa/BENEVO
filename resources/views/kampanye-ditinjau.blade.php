<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Kampanye perlu Ditinjau</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-page: #f2ecfa;
            --bg-sidebar: #ffffff;
            --bg-card: #ffffff;
            --brand-purple: #855cb8;
            --brand-purple-heading: #2d174e;
            --brand-text-dark: #1f1b26;
            --brand-text-muted: #6e727e;
            --brand-border: #e9e2f5;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg-page);
            color: var(--brand-text-dark);
            min-height: 100vh;
            display: flex;
            -webkit-font-smoothing: antialiased;
        }

        .app-wrapper {
            display: flex;
            width: 100vw;
            min-height: 100vh;
            overflow: hidden;
        }

        /* ========== SIDEBAR ========== */
        .sidebar {
            width: 275px;
            max-width: 275px;
            background-color: var(--bg-sidebar);
            border-right: 1px solid var(--brand-border);
            display: flex;
            flex-direction: column;
            padding: 24px 16px;
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
            background: transparent;
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
            display: block;
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
            font-size: 2.1rem;
            font-weight: 800;
            letter-spacing: -0.06em;
            line-height: 0.9;
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

        .mode-banner {
            margin-top: 24px;
            background-color: #f0e8fc;
            border-radius: 10px;
            padding: 10px 12px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .mode-left {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .mode-dot {
            width: 9px;
            height: 9px;
            background-color: #6a3ab2;
            border-radius: 50%;
        }

        .mode-title {
            font-size: 0.85rem;
            font-weight: 700;
            color: #3b2260;
            line-height: 1.2;
        }

        .mode-sub {
            font-size: 0.73rem;
            color: #7d6b97;
            font-weight: 500;
        }

        .mode-badge {
            background-color: #fde8db;
            color: #cb5d2c;
            font-size: 0.68rem;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 5px;
        }

        .nav-section {
            margin-top: 24px;
        }

        .nav-section-title {
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #8c829e;
            padding-left: 10px;
            margin-bottom: 8px;
        }

        .nav-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px 12px;
            border-radius: 10px;
            color: #4b3d60;
            text-decoration: none;
            font-size: 0.88rem;
            font-weight: 600;
            transition: all 0.15s ease;
        }

        .nav-link:hover {
            background-color: #f7f2fc;
            color: #2b1647;
        }

        .nav-link.active {
            background-color: #8254bc;
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(130, 84, 188, 0.3);
        }

        .nav-link svg {
            width: 18px;
            height: 18px;
            fill: none;
            stroke: currentColor;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
            flex-shrink: 0;
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

        /* ========== MAIN WRAPPER & TOPBAR ========== */
        .main-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            overflow-y: auto;
        }

        .topbar {
            background-color: var(--bg-card);
            border-bottom: 1px solid var(--brand-border);
            padding: 18px 36px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            position: sticky;
            top: 0;
            z-index: 90;
        }

        .search-container {
            display: flex;
            align-items: center;
            background-color: #f7f4fc;
            border: 1px solid #ebdff8;
            border-radius: 99px;
            padding: 8px 18px;
            width: 100%;
            max-width: 360px;
            gap: 10px;
        }

        .search-icon {
            display: flex;
            align-items: center;
            color: #8c829e;
        }

        .search-icon svg {
            width: 16px;
            height: 16px;
        }

        .search-input {
            border: none;
            background: transparent;
            outline: none;
            font-family: inherit;
            font-size: 0.85rem;
            color: var(--brand-text-dark);
            width: 100%;
        }

        .search-input::placeholder {
            color: #9f98ae;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .date-picker-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            background-color: #ffffff;
            border: 1px solid #e2d8f0;
            padding: 8px 14px;
            border-radius: 8px;
            font-size: 0.78rem;
            font-weight: 600;
            color: #433956;
            cursor: pointer;
            transition: all 0.15s;
        }

        .date-picker-btn svg {
            width: 15px;
            height: 15px;
        }

        .icon-action-btn {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            background: #ffffff;
            border: 1px solid #e2d8f0;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            position: relative;
            color: #55486d;
            transition: all 0.15s;
        }

        .icon-action-btn svg {
            width: 18px;
            height: 18px;
        }

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
            transition: background 0.15s;
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

        /* ========== CONTENT AREA (Images 2 & 3) ========== */
        .content-area {
            padding: 30px 36px 60px 36px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .page-title {
            font-size: 1.95rem;
            font-weight: 800;
            color: #2b1d4c;
            letter-spacing: -0.025em;
        }

        /* Table Card */
        .table-card {
            background-color: var(--bg-card);
            border-radius: 24px;
            padding: 32px 34px;
            box-shadow: 0 4px 20px rgba(90, 50, 140, 0.05);
            display: flex;
            flex-direction: column;
        }

        .table-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
            flex-wrap: wrap;
            gap: 14px;
        }

        .table-card-title {
            font-size: 1.55rem;
            font-weight: 800;
            color: #2b1d4c;
            letter-spacing: -0.02em;
        }

        /* Custom Dropdown Filter (Image 3) */
        .dropdown-container {
            position: relative;
            display: inline-block;
        }

        .filter-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background-color: #ffffff;
            border: 1.5px solid #dcd1f3;
            border-radius: 10px;
            padding: 8px 16px;
            font-size: 0.86rem;
            font-weight: 600;
            color: #3b285b;
            cursor: pointer;
            transition: all 0.15s ease;
            font-family: inherit;
        }

        .filter-btn:hover {
            border-color: #8254bc;
            background-color: #faf7fd;
        }

        .filter-btn svg {
            width: 13px;
            height: 13px;
            stroke: currentColor;
            stroke-width: 2.5;
            fill: none;
            transition: transform 0.2s ease;
        }

        .dropdown-menu {
            position: absolute;
            top: calc(100% + 6px);
            right: 0;
            background: #ffffff;
            border: 1px solid #e2d7f5;
            border-radius: 12px;
            box-shadow: 0 10px 26px rgba(45, 20, 80, 0.12);
            width: 260px;
            padding: 6px 0;
            display: none;
            flex-direction: column;
            z-index: 1000;
        }

        .dropdown-menu.show {
            display: flex;
        }

        .dropdown-item {
            padding: 10px 16px;
            font-size: 0.84rem;
            color: #3f2f5c;
            font-weight: 600;
            text-decoration: none;
            transition: background 0.12s ease;
            cursor: pointer;
            border-bottom: 1px solid #f6f1fc;
        }

        .dropdown-item:last-child {
            border-bottom: none;
        }

        .dropdown-item:hover {
            background-color: #f7f1fc;
            color: #6a34ab;
        }

        /* Table */
        .antrean-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.88rem;
        }

        .antrean-table thead {
            background-color: #dcd0f2;
        }

        .antrean-table thead th {
            padding: 14px 18px;
            text-align: left;
            font-size: 0.86rem;
            font-weight: 800;
            color: #352650;
            white-space: nowrap;
            letter-spacing: -0.01em;
        }

        .antrean-table tbody tr {
            border-bottom: 1px solid #f0eaf8;
            transition: background 0.15s ease;
        }

        .antrean-table tbody tr:last-child {
            border-bottom: none;
        }

        .antrean-table tbody tr:hover {
            background-color: #fcf9ff;
        }

        .antrean-table td {
            padding: 18px 18px;
            color: #2a2833;
            font-weight: 500;
            vertical-align: top;
            line-height: 1.45;
        }

        .td-id {
            font-weight: 700;
            color: #2b1d4c;
            white-space: nowrap;
        }

        .td-campaign-title {
            font-weight: 700;
            color: #2a1e46;
            max-width: 220px;
        }

        .td-report-type {
            color: #2a1e46;
            font-weight: 500;
            max-width: 200px;
        }

        .td-desc {
            color: #332b40;
            font-size: 0.86rem;
            max-width: 260px;
        }

        .td-status {
            white-space: nowrap;
        }

        .btn-tinjau {
            color: #794ea8;
            font-weight: 700;
            font-size: 0.88rem;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.15s;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .btn-tinjau:hover {
            color: #4b1f7d;
            text-decoration: underline;
        }

        .status-dibekukan-text {
            color: #2b1d4c;
            font-weight: 600;
            font-size: 0.86rem;
        }

        /* Table Footer */
        .table-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 24px;
            padding-top: 16px;
            border-top: 1px solid #f0eaf8;
        }

        .table-info {
            font-size: 0.82rem;
            color: #787389;
            font-weight: 600;
        }

        .pagination {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .page-btn {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            border: 1px solid #ddd4ef;
            background: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 0.82rem;
            font-weight: 600;
            color: #55486d;
            transition: all 0.15s;
        }

        .page-btn:hover {
            border-color: #8254bc;
            color: #8254bc;
        }

        .page-btn.active {
            background-color: #ebe2f8;
            border-color: #8254bc;
            color: #4b2679;
            font-weight: 700;
        }

        .page-btn svg {
            width: 14px;
            height: 14px;
            stroke: currentColor;
            stroke-width: 2.2;
            fill: none;
        }

        /* ========== LOGOUT MODAL ========== */
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
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- ======== SIDEBAR ======== -->
        <aside class="sidebar">
            <a href="{{ route('dashboard') }}" class="sidebar-brand">
                <div class="brand-logo-badge" aria-hidden="true">
                    <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
                </div>
                <div class="brand-text-block">
                    <div class="brand-wordmark-wrap">
                        <span class="brand-wordmark brand-gradient">Benevo</span>
                        <div class="brand-yellow-dot" aria-hidden="true"></div>
                    </div>
                    <div class="brand-platform-sub">CMS PLATFORM</div>
                </div>
            </a>

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
            <div class="nav-section">
                <div class="nav-section-title">Menu Utama</div>
                <ul class="nav-list">
                    <li>
                        <a href="{{ route('dashboard') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1.5"/><rect x="14" y="3" width="7" height="7" rx="1.5"/><rect x="14" y="14" width="7" height="7" rx="1.5"/><rect x="3" y="14" width="7" height="7" rx="1.5"/></svg>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('rekapitulasi-dana') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/><path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/><path d="M18 12a2 2 0 0 0 0 4h4v-4z"/></svg>
                            Rekapitulasi Dana
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('manajemen-kampanye') }}" class="nav-link active">
                            <svg viewBox="0 0 24 24"><path d="M3 11l18-5v12L3 14v-3z"/><path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/></svg>
                            Manajemen Kampanye
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('donatur') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                            Donatur
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Admin Section -->
            <div class="nav-section">
                <div class="nav-section-title">Admin</div>
                <ul class="nav-list">
                    <li>
                        <a href="{{ route('kelola-akun-operator') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"/><circle cx="12" cy="12" r="3"/></svg>
                            Kelola Akun Operator
                        </a>
                    </li>
                </ul>
            </div>

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

        <!-- ======== MAIN WRAPPER ======== -->
        <div class="main-wrapper">
            <!-- Topbar -->
            <header class="topbar">
                <div class="search-container">
                    <span class="search-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"/>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                        </svg>
                    </span>
                    <input type="text" class="search-input" placeholder="Cari Apapun...">
                </div>

                <div class="topbar-right">
                    <button class="date-picker-btn" type="button">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                            <line x1="16" y1="2" x2="16" y2="6"/>
                            <line x1="8" y1="2" x2="8" y2="6"/>
                            <line x1="3" y1="10" x2="21" y2="10"/>
                        </svg>
                        <span>30 Hari Terakhir</span>
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:11px;height:11px;">
                            <polyline points="6 9 12 15 18 9"/>
                        </svg>
                    </button>
                    <button class="icon-action-btn" type="button">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                        </svg>
                        <span class="notif-badge-dot"></span>
                    </button>
                    <button class="help-action-btn" type="button">?</button>
                    <div class="profile-pill">
                        <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=120&q=80" alt="Harry Vaughan" class="profile-avatar">
                        <div>
                            <div class="profile-name">Harry Vaughan</div>
                            <div class="profile-role">Admin</div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Main Content (Images 2 & 3) -->
            <main class="content-area">
                <h1 class="page-title">Kampanye perlu Ditinjau</h1>

                <div class="table-card">
                    <div class="table-card-header">
                        <h2 class="table-card-title">Antrean Peninjauan</h2>

                        <!-- Dropdown Filter: Jenis Laporan (Image 3) -->
                        <div class="dropdown-container">
                            <button type="button" class="filter-btn" id="filterDropdownBtn" onclick="toggleFilterDropdown()">
                                <span id="currentFilterLabel">Jenis Laporan</span>
                                <svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg>
                            </button>
                            <div class="dropdown-menu" id="filterDropdownMenu">
                                <div class="dropdown-item" onclick="selectFilter('Semua Laporan')">Semua Laporan</div>
                                <div class="dropdown-item" onclick="selectFilter('Dugaan Penyalahgunaan Dana')">Dugaan Penyalahgunaan Dana</div>
                                <div class="dropdown-item" onclick="selectFilter('Penggunaan dana tidak transparan')">Penggunaan dana tidak transparan</div>
                                <div class="dropdown-item" onclick="selectFilter('Foto atau Konten menyesatkan')">Foto atau Konten menyesatkan</div>
                                <div class="dropdown-item" onclick="selectFilter('Informasi Kampanye tidak jelas')">Informasi Kampanye tidak jelas</div>
                                <div class="dropdown-item" onclick="selectFilter('Indikasi Kampanye palsu')">Indikasi Kampanye palsu</div>
                            </div>
                        </div>
                    </div>

                    <!-- Antrean Table -->
                    <table class="antrean-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Kampanye</th>
                                <th>Jenis Laporan</th>
                                <th>Keterangan Alasan</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Row 1 -->
                            <tr>
                                <td><span class="td-id">K01</span></td>
                                <td><div class="td-campaign-title">Bantuan Bencana Gempa NTT</div></td>
                                <td><div class="td-report-type">Dugaan Penyalahgunaan Dana</div></td>
                                <td><div class="td-desc">Dana terkumpul besar tetapi belum ada bukti penyaluran bantuan.</div></td>
                                <td class="td-status">
                                    <a href="{{ route('detail-peninjauan-kampanye') }}" class="btn-tinjau">Tinjau</a>
                                </td>
                            </tr>
                            <!-- Row 2 (Image 3 target) -->
                            <tr>
                                <td><span class="td-id">K02</span></td>
                                <td><div class="td-campaign-title">Darurat Karhutla Kalimantan</div></td>
                                <td><div class="td-report-type">Penggunaan dana tidak transparan</div></td>
                                <td><div class="td-desc">Laporan pengeluaran belum diperbarui selama 3 minggu.</div></td>
                                <td class="td-status">
                                    <a href="{{ route('detail-peninjauan-kampanye') }}" class="btn-tinjau">Tinjau</a>
                                </td>
                            </tr>
                            <!-- Row 3 -->
                            <tr>
                                <td><span class="td-id">K03</span></td>
                                <td><div class="td-campaign-title">Bantuan Keselamatan Korban Banjir Aceh</div></td>
                                <td><div class="td-report-type">Foto atau Konten menyesatkan</div></td>
                                <td><div class="td-desc">Foto kegiatan tampak bukan dari lokasi bencana.</div></td>
                                <td class="td-status">
                                    <a href="{{ route('detail-peninjauan-kampanye') }}" class="btn-tinjau">Tinjau</a>
                                </td>
                            </tr>
                            <!-- Row 4 -->
                            <tr>
                                <td><span class="td-id">K04</span></td>
                                <td><div class="td-campaign-title">Sedekah untuk Panti Asuhan Nurani</div></td>
                                <td><div class="td-report-type">Informasi Kampanye tidak jelas</div></td>
                                <td><div class="td-desc">Informasi kampanye sangat sedikit informasi, dan tidak ada rincian yang jelas</div></td>
                                <td class="td-status">
                                    <span class="status-dibekukan-text">Dibekukan</span>
                                </td>
                            </tr>
                            <!-- Row 5 -->
                            <tr>
                                <td><span class="td-id">K05</span></td>
                                <td><div class="td-campaign-title">Penanaman 250.000 Pohon di Sumatra</div></td>
                                <td><div class="td-report-type">Indikasi Kampanye palsu</div></td>
                                <td><div class="td-desc">Data penerima dan lokasi penanaman tidak bisa diverifikasi.</div></td>
                                <td class="td-status">
                                    <span class="status-dibekukan-text">Dibekukan</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Table Footer -->
                    <div class="table-footer">
                        <div class="table-info">
                            Menampilkan 5 dari 115 Lainnya
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
        function toggleFilterDropdown() {
            const menu = document.getElementById('filterDropdownMenu');
            if (menu) {
                menu.classList.toggle('show');
            }
        }

        function selectFilter(name) {
            const label = document.getElementById('currentFilterLabel');
            if (label) {
                label.textContent = name;
            }
            const menu = document.getElementById('filterDropdownMenu');
            if (menu) {
                menu.classList.remove('show');
            }
        }

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
            const btn = document.getElementById('filterDropdownBtn');
            const menu = document.getElementById('filterDropdownMenu');
            if (menu && !menu.contains(e.target) && !btn.contains(e.target)) {
                menu.classList.remove('show');
            }
            const logoutModal = document.getElementById('logoutModal');
            if (e.target === logoutModal) {
                closeLogoutModal();
            }
        });

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                const menu = document.getElementById('filterDropdownMenu');
                if (menu) menu.classList.remove('show');
                closeLogoutModal();
            }
        });
    </script>
</body>
</html>
