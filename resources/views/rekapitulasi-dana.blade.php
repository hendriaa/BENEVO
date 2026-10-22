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
            --bg-page: #f2ecfa;
            --bg-sidebar: #ffffff;
            --bg-card: #ffffff;
            --brand-purple: #855cb8;
            --brand-purple-dark: #2d164d;
            --brand-purple-heading: #2d174e;
            --brand-text-dark: #1f1b26;
            --brand-text-muted: #6e727e;
            --brand-border: #ede6f5;
            --accent-yellow: #e8c643;
            --accent-peach-bg: #fde8db;
            --accent-peach-text: #cb5d2c;
            --accent-gray-bg: #ebe5f5;
            --accent-gray-text: #6c5490;
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
            width: 248px;
            background-color: var(--bg-sidebar);
            border-right: 1px solid var(--brand-border);
            display: flex;
            flex-direction: column;
            padding: 24px 16px 24px 16px;
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

        /* Mode Banner */
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
            background-color: var(--accent-peach-bg);
            color: var(--accent-peach-text);
            font-size: 0.68rem;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 5px;
        }

        /* Nav */
        .nav-section {
            margin-top: 24px;
        }

        .nav-section-title {
            font-size: 0.8rem;
            font-weight: 600;
            color: #747783;
            margin-bottom: 10px;
            padding-left: 8px;
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
            gap: 10px;
            padding: 10px 14px;
            border-radius: 9px;
            text-decoration: none;
            font-size: 0.88rem;
            font-weight: 600;
            color: #555966;
            transition: all 0.2s ease;
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
            height: 66px;
            background-color: #ffffff;
            border-bottom: 1px solid var(--brand-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
            gap: 16px;
            flex-shrink: 0;
        }

        .search-container {
            position: relative;
            width: 100%;
            max-width: 340px;
        }

        .search-icon {
            position: absolute;
            left: 13px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ea2ae;
            display: flex;
            align-items: center;
            pointer-events: none;
        }

        .search-icon svg {
            width: 16px;
            height: 16px;
        }

        .search-input {
            width: 100%;
            height: 40px;
            background-color: #fbf9fd;
            border: 1px solid #ece4f5;
            border-radius: 9999px;
            padding: 0 14px 0 36px;
            font-size: 0.86rem;
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

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .date-picker-btn {
            display: flex;
            align-items: center;
            gap: 7px;
            height: 38px;
            padding: 0 12px;
            background-color: #ffffff;
            border: 1px solid #e7dff2;
            border-radius: 8px;
            font-size: 0.8rem;
            font-weight: 600;
            color: #4b4f5a;
            cursor: pointer;
        }

        .date-picker-btn svg {
            width: 14px;
            height: 14px;
            color: #7957a7;
        }

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
        }

        .icon-action-btn svg {
            width: 16px;
            height: 16px;
        }

        .notif-badge-dot {
            position: absolute;
            top: 6px;
            right: 6px;
            width: 6px;
            height: 6px;
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
            font-size: 0.9rem;
            font-weight: 700;
        }

        .profile-pill {
            display: flex;
            align-items: center;
            gap: 9px;
            margin-left: 4px;
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
            font-size: 0.84rem;
            font-weight: 700;
            color: #232227;
            line-height: 1.2;
        }

        .profile-role {
            font-size: 0.7rem;
            font-weight: 500;
            color: #797c88;
        }

        /* ========== PAGE CONTENT ========== */
        .content-area {
            padding: 26px 30px 40px 30px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .page-title {
            font-size: 1.9rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.025em;
        }

        /* Metric Cards */
        .metrics-row {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
            max-width: 680px;
        }

        .metric-card {
            background-color: var(--bg-card);
            border-radius: 16px;
            padding: 20px 22px;
            box-shadow: 0 2px 12px rgba(100, 60, 150, 0.05);
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 12px;
        }

        .metric-text {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .metric-label {
            font-size: 0.85rem;
            font-weight: 600;
            color: #5c606d;
        }

        .metric-value {
            font-size: 1.7rem;
            font-weight: 800;
            color: var(--brand-text-dark);
            letter-spacing: -0.03em;
            line-height: 1.1;
        }

        .metric-arrow {
            color: #61b068;
            display: flex;
            align-items: flex-start;
            margin-top: 6px;
        }

        .metric-arrow svg {
            width: 20px;
            height: 20px;
        }

        /* ========== CARD BASE ========== */
        .section-card {
            background-color: var(--bg-card);
            border-radius: 18px;
            padding: 22px 26px;
            box-shadow: 0 2px 14px rgba(100, 60, 150, 0.05);
        }

        /* Arus Dana */
        .card-header-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 18px;
            flex-wrap: wrap;
            gap: 12px;
        }

        .card-section-title {
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.02em;
        }

        .card-section-sub {
            font-size: 0.76rem;
            color: #878b98;
            font-weight: 500;
            margin-top: 3px;
        }

        .filter-row {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .month-filter-btn {
            display: flex;
            align-items: center;
            gap: 6px;
            height: 34px;
            padding: 0 12px;
            background: #f4effc;
            border: 1px solid #ddd4ef;
            border-radius: 8px;
            font-size: 0.82rem;
            font-weight: 600;
            color: #4a3870;
            cursor: pointer;
        }

        .month-filter-btn svg {
            width: 12px;
            height: 12px;
        }

        .legend-dots {
            display: flex;
            align-items: center;
            gap: 14px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .legend-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
        }

        .legend-dot.yellow { background-color: #e8c643; }
        .legend-dot.purple { background-color: #855cb8; }
        .legend-dot.yellow-fill { background-color: #e8c643; }
        .legend-dot.purple-fill { background-color: #855cb8; }

        /* Chart containers */
        .chart-container {
            position: relative;
            width: 100%;
            height: 220px;
        }

        /* Aktivitas Dana Layout */
        .aktivitas-body {
            display: flex;
            gap: 24px;
            align-items: stretch;
        }

        .aktivitas-chart-area {
            flex: 1;
            min-width: 0;
            position: relative;
            height: 220px;
        }

        .aktivitas-chart-nav {
            display: flex;
            align-items: center;
            position: absolute;
            top: 50%;
            left: -14px;
            transform: translateY(-50%);
        }

        .chart-nav-btn {
            width: 26px;
            height: 26px;
            border-radius: 50%;
            background: #f4f0f8;
            border: 1px solid #ddd4ef;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #7045a2;
        }

        .chart-nav-btn.right {
            position: absolute;
            right: -14px;
            top: 50%;
            transform: translateY(-50%);
        }

        .chart-nav-btn svg {
            width: 12px;
            height: 12px;
            stroke: currentColor;
            stroke-width: 2.5;
            fill: none;
        }

        .aktivitas-side-stats {
            display: flex;
            flex-direction: column;
            gap: 14px;
            min-width: 185px;
            justify-content: center;
        }

        .aktivitas-stat-card {
            background-color: #f9f6fd;
            border-radius: 12px;
            padding: 14px 16px;
        }

        .aktivitas-stat-label {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 0.75rem;
            font-weight: 700;
            color: #6a4f93;
            margin-bottom: 6px;
        }

        .aktivitas-stat-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
        }

        .aktivitas-stat-dot.purple { background-color: #855cb8; }
        .aktivitas-stat-dot.yellow { background-color: #e8c643; }

        .aktivitas-stat-value {
            font-size: 1.3rem;
            font-weight: 800;
            color: #1f1b26;
            letter-spacing: -0.02em;
            margin-bottom: 8px;
        }

        .aktivitas-bar-row {
            display: flex;
            gap: 3px;
            align-items: flex-end;
            height: 18px;
        }

        .mini-bar {
            height: 100%;
            border-radius: 3px;
        }

        .mini-bar.full { background-color: #855cb8; flex: 3; }
        .mini-bar.mid  { background-color: #a87fd5; flex: 1.5; height: 80%; }
        .mini-bar.sm   { background-color: #c9a9e8; flex: 1; height: 55%; }
        .mini-bar.xs   { background-color: #e0d0f4; flex: 0.7; height: 35%; }
        .mini-bar.full-y { background-color: #e8c643; flex: 3; }
        .mini-bar.mid-y  { background-color: #f0d670; flex: 1.8; height: 75%; }
        .mini-bar.sm-y   { background-color: #f5e499; flex: 1; height: 50%; }

        /* ========== MUTASI TABLE ========== */
        .table-header-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 16px;
            flex-wrap: wrap;
            gap: 12px;
        }

        .table-title-block {
            display: flex;
            flex-direction: column;
        }

        .table-filters {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .table-filter-input {
            display: flex;
            align-items: center;
            gap: 7px;
            height: 38px;
            padding: 0 12px;
            background: #f6f2fc;
            border: 1px solid #ddd4ef;
            border-radius: 8px;
            font-size: 0.8rem;
            font-weight: 600;
            color: #5a4780;
            cursor: pointer;
        }

        .table-filter-input svg {
            width: 14px;
            height: 14px;
            stroke: #7045a2;
            fill: none;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        /* Mutasi Table Styles */
        .mutasi-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.82rem;
        }

        .mutasi-table thead {
            background-color: #f6f2fc;
        }

        .mutasi-table thead th {
            padding: 12px 14px;
            text-align: left;
            font-size: 0.8rem;
            font-weight: 700;
            color: #5b4d76;
            white-space: nowrap;
        }

        .mutasi-table tbody tr {
            border-bottom: 1px solid #f0eaf8;
            transition: background 0.15s;
        }

        .mutasi-table tbody tr:last-child {
            border-bottom: none;
        }

        .mutasi-table tbody tr:hover {
            background-color: #faf7fd;
        }

        .mutasi-table td {
            padding: 14px 14px;
            color: #2d2e35;
            font-weight: 500;
            vertical-align: top;
        }

        .tx-id {
            font-weight: 700;
            color: #4a3870;
            font-size: 0.8rem;
        }

        .tx-time-main {
            font-weight: 600;
            color: #2d2e35;
        }

        .tx-time-sub {
            font-size: 0.74rem;
            color: #9094a0;
        }

        .donor-handle {
            font-size: 0.74rem;
            color: #888c99;
        }

        .kanal-badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 3px 9px;
            border-radius: 99px;
            font-size: 0.74rem;
            font-weight: 700;
        }

        .kanal-badge.qris    { background: #f0ebfc; color: #6a42a8; }
        .kanal-badge.gopay   { background: #e8f7e8; color: #257a36; }
        .kanal-badge.seabank { background: #e8f0fb; color: #1e5cbf; }
        .kanal-badge.shopee  { background: #fff3e8; color: #c65d00; }
        .kanal-badge.dana    { background: #e8f2ff; color: #1a6fcf; }

        .nominal-val {
            font-weight: 700;
            color: #1f1b26;
            white-space: nowrap;
        }

        /* Table Footer / Pagination */
        .table-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 18px;
            padding-top: 14px;
            border-top: 1px solid #f0eaf8;
        }

        .table-info {
            font-size: 0.78rem;
            color: #888c99;
            font-weight: 500;
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
            color: #5a4780;
            transition: all 0.15s;
        }

        .page-btn:hover {
            background: #f4effc;
            border-color: #c8b8e8;
        }

        .page-btn.active {
            background-color: var(--brand-purple);
            border-color: var(--brand-purple);
            color: #ffffff;
        }

        .page-btn svg {
            width: 14px;
            height: 14px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2.5;
            stroke-linecap: round;
            stroke-linejoin: round;
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

    <!-- ======== SIDEBAR ======== -->
    <aside class="sidebar">
        <a href="{{ route('dashboard') }}" class="sidebar-brand">
            <div class="brand-logo-badge" aria-hidden="true">
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

        <div class="nav-section">
            <div class="nav-section-title">Menu Utama</div>
            <ul class="nav-list">
                <li>
                    <a href="{{ route('dashboard') }}" class="nav-link">
                        <svg viewBox="0 0 24 24">
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
                        <svg viewBox="0 0 24 24">
                            <path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/>
                            <path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/>
                            <path d="M18 12a2 2 0 0 0 0 4h4v-4z"/>
                        </svg>
                        Rekaptulasi Dana
                    </a>
                </li>
                <li>
                    <a href="{{ route('manajemen-kampanye') }}" class="nav-link">
                        <svg viewBox="0 0 24 24">
                            <path d="M3 11l18-5v12L3 14v-3z"/>
                            <path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/>
                        </svg>
                        Manajemen Kampanye
                    </a>
                </li>
                <li>
                    <a href="{{ route('donatur') }}" class="nav-link">
                        <svg viewBox="0 0 24 24">
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

        <div class="nav-section">
            <div class="nav-section-title">Admin</div>
            <ul class="nav-list">
                <li>
                    <a href="{{ route('kelola-akun-operator') }}" class="nav-link">
                        <svg viewBox="0 0 24 24">
                            <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
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

    <!-- ======== MAIN CONTENT ======== -->
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

        <!-- Page Content -->
        <main class="content-area">
            <h1 class="page-title">Rekaptulasi Dana</h1>

            <!-- METRIC CARDS -->
            <div class="metrics-row">
                <div class="metric-card">
                    <div class="metric-text">
                        <div class="metric-label">Total Dana Terkumpul</div>
                        <div class="metric-value">RP 689.721.095</div>
                    </div>
                    <div class="metric-arrow">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/>
                            <polyline points="17 6 23 6 23 12"/>
                        </svg>
                    </div>
                </div>
                <div class="metric-card">
                    <div class="metric-text">
                        <div class="metric-label">Total Dana Tersalurkan</div>
                        <div class="metric-value">RP 532.775.241</div>
                    </div>
                    <div class="metric-arrow">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/>
                            <polyline points="17 6 23 6 23 12"/>
                        </svg>
                    </div>
                </div>
            </div>

            <!-- ARUS DANA CHART -->
            <div class="section-card">
                <div class="card-header-row">
                    <div>
                        <div class="card-section-title">Arus Dana</div>
                        <div class="card-section-sub">Rekap arus dana yang terkumpul dan telah tersalurkan sepama 30 hari</div>
                    </div>
                    <div class="filter-row">
                        <button class="month-filter-btn" type="button">
                            Oktober
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="6 9 12 15 18 9"/>
                            </svg>
                        </button>
                        <div class="legend-dots">
                            <div class="legend-item">
                                <span class="legend-dot yellow"></span>
                                <span style="color:#888;">Terkumpul</span>
                            </div>
                            <div class="legend-item">
                                <span class="legend-dot purple"></span>
                                <span style="color:#888;">Tersalurkan</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="chart-container">
                    <canvas id="arusDanaChart"></canvas>
                </div>
            </div>

            <!-- AKTIVITAS DANA -->
            <div class="section-card">
                <div class="card-header-row">
                    <div>
                        <div class="card-section-title">Aktivitas Dana</div>
                        <div class="card-section-sub">Rekapitulasi dana yang masuk dan cair setiap minggu.</div>
                    </div>
                    <div class="filter-row">
                        <button class="month-filter-btn" type="button">
                            October
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="6 9 12 15 18 9"/>
                            </svg>
                        </button>
                        <div class="legend-dots">
                            <div class="legend-item">
                                <span class="legend-dot yellow"></span>
                                <span style="color:#888;">Pencairan</span>
                            </div>
                            <div class="legend-item">
                                <span class="legend-dot purple"></span>
                                <span style="color:#888;">Pemasukan</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="aktivitas-body" style="position:relative;">
                    <!-- Nav Left -->
                    <button class="chart-nav-btn" style="position:absolute;left:-8px;top:50%;transform:translateY(-50%);z-index:2;" type="button">
                        <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg>
                    </button>
                    <div class="aktivitas-chart-area">
                        <canvas id="aktivitasChart"></canvas>
                    </div>
                    <!-- Nav Right -->
                    <button class="chart-nav-btn" style="position:absolute;right:-8px;top:50%;transform:translateY(-50%);z-index:2;" type="button">
                        <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg>
                    </button>

                    <!-- Side Stats -->
                    <div class="aktivitas-side-stats">
                        <div class="aktivitas-stat-card">
                            <div class="aktivitas-stat-label">
                                <span class="aktivitas-stat-dot purple"></span>
                                <span>Pemasukan</span>
                            </div>
                            <div class="aktivitas-stat-value">Rp 12.450.761</div>
                            <div class="aktivitas-bar-row">
                                <div class="mini-bar full"></div>
                                <div class="mini-bar mid"></div>
                                <div class="mini-bar sm"></div>
                                <div class="mini-bar xs"></div>
                                <div class="mini-bar full"></div>
                                <div class="mini-bar mid"></div>
                            </div>
                        </div>

                        <div class="aktivitas-stat-card">
                            <div class="aktivitas-stat-label">
                                <span class="aktivitas-stat-dot yellow"></span>
                                <span>Pencairan</span>
                            </div>
                            <div class="aktivitas-stat-value">Rp 9.323.117</div>
                            <div class="aktivitas-bar-row">
                                <div class="mini-bar full-y"></div>
                                <div class="mini-bar mid-y"></div>
                                <div class="mini-bar sm-y"></div>
                                <div class="mini-bar mid-y"></div>
                                <div class="mini-bar full-y"></div>
                                <div class="mini-bar sm-y"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- DATA MUTASI & REAL-TIME TABLE -->
            <div class="section-card">
                <div class="table-header-row">
                    <div class="table-title-block">
                        <div class="card-section-title">Data Mutasi &amp; Real - Time</div>
                        <div class="card-section-sub">Aktivitas dana di dalam benevo.</div>
                    </div>
                    <div class="table-filters">
                        <div class="table-filter-input">
                            <svg viewBox="0 0 24 24">
                                <line x1="8" y1="6" x2="21" y2="6"/>
                                <line x1="8" y1="12" x2="21" y2="12"/>
                                <line x1="8" y1="18" x2="21" y2="18"/>
                                <line x1="3" y1="6" x2="3.01" y2="6"/>
                                <line x1="3" y1="12" x2="3.01" y2="12"/>
                                <line x1="3" y1="18" x2="3.01" y2="18"/>
                            </svg>
                            <span>Jenis Pembayaran</span>
                        </div>
                        <div class="table-filter-input">
                            <svg viewBox="0 0 24 24">
                                <path d="M12 2v20M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                            </svg>
                            <span>Nominal</span>
                        </div>
                    </div>
                </div>

                <table class="mutasi-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Waktu Transaksi</th>
                            <th>Nama Donatur</th>
                            <th>Kampanye Tujuan</th>
                            <th>Kanal Bayar</th>
                            <th>Nominal Bruto</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span class="tx-id">BNV-PA11</span></td>
                            <td>
                                <div class="tx-time-main">Senin, 12 October 2026</div>
                                <div class="tx-time-sub">09:30 WIB</div>
                            </td>
                            <td>
                                <div>Anonim</div>
                                <div class="donor-handle">IP. 192.168.72.10</div>
                            </td>
                            <td>Bantu Padamkan Karhutla</td>
                            <td><span class="kanal-badge qris">QRIS</span></td>
                            <td><span class="nominal-val">Rp 50.000</span></td>
                        </tr>
                        <tr>
                            <td><span class="tx-id">BNV-SH12</span></td>
                            <td>
                                <div class="tx-time-main">Senin, 12 October 2026</div>
                                <div class="tx-time-sub">12:30 WIB</div>
                            </td>
                            <td>
                                <div>Hendria</div>
                                <div class="donor-handle">@hn.dri_...</div>
                            </td>
                            <td>Bantu Padamkan Karhutla</td>
                            <td><span class="kanal-badge gopay">GoPay</span></td>
                            <td><span class="nominal-val">Rp 150.000</span></td>
                        </tr>
                        <tr>
                            <td><span class="tx-id">BNV-MA12</span></td>
                            <td>
                                <div class="tx-time-main">Senin, 12 October 2026</div>
                                <div class="tx-time-sub">21:30 WIB</div>
                            </td>
                            <td>
                                <div>Asya</div>
                                <div class="donor-handle">@lia.sya_...</div>
                            </td>
                            <td>Bantu Padamkan Karhutla</td>
                            <td><span class="kanal-badge seabank">Seabank</span></td>
                            <td><span class="nominal-val">Rp 200.000</span></td>
                        </tr>
                        <tr>
                            <td><span class="tx-id">BNV-PF12</span></td>
                            <td>
                                <div class="tx-time-main">Selasa, 13 October 2026</div>
                                <div class="tx-time-sub">08:45 WIB</div>
                            </td>
                            <td>
                                <div>Fharol</div>
                                <div class="donor-handle">@fhr.aml_...</div>
                            </td>
                            <td>Bantuan Bencana Korban NTT</td>
                            <td><span class="kanal-badge shopee">ShopeePay</span></td>
                            <td><span class="nominal-val">Rp 250.000</span></td>
                        </tr>
                        <tr>
                            <td><span class="tx-id">BNV-SA12</span></td>
                            <td>
                                <div class="tx-time-main">Selasa, 13 October 2026</div>
                                <div class="tx-time-sub">16:40 WIB</div>
                            </td>
                            <td>
                                <div>Aulia</div>
                                <div class="donor-handle">@aul.lias_...</div>
                            </td>
                            <td>Bantuan Bencana Korban NTT</td>
                            <td><span class="kanal-badge dana">Dana</span></td>
                            <td><span class="nominal-val">Rp 300.000</span></td>
                        </tr>
                        <tr>
                            <td><span class="tx-id">BNV-MA12</span></td>
                            <td>
                                <div class="tx-time-main">Selasa, 13 October 2026</div>
                                <div class="tx-time-sub">23:15 WIB</div>
                            </td>
                            <td>
                                <div>Zulfan</div>
                                <div class="donor-handle">@zul.faf_...</div>
                            </td>
                            <td>Bantuan Bencana Korban NTT</td>
                            <td><span class="kanal-badge qris">QRIS</span></td>
                            <td><span class="nominal-val">Rp 350.000</span></td>
                        </tr>
                    </tbody>
                </table>

                <div class="table-footer">
                    <div class="table-info">Menampilkan 1 - 4 halaman.</div>
                    <div class="pagination">
                        <button class="page-btn" type="button">
                            <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg>
                        </button>
                        <button class="page-btn active" type="button">1</button>
                        <button class="page-btn" type="button">
                            <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg>
                        </button>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- ======== CHART JS ======== -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {

            // Set global animation defaults for Chart.js v4
            Chart.defaults.set('animation', {
                duration: 2000,
                easing: 'easeInOutQuart'
            });

            // --- ARUS DANA Line Chart ---
            const arusCtx = document.getElementById('arusDanaChart').getContext('2d');

            const terkumpulData = [850, 300, 920, 550, 750, 850, 650, 200, 480, 780, 900, 450, 350, 680, 920, 820, 950, 700, 400, 650, 780, 500, 350, 900, 750, 600, 850, 430, 700];
            const tersalurkanData = [500, 550, 400, 700, 600, 250, 580, 750, 450, 300, 700, 620, 800, 550, 400, 650, 580, 700, 480, 350, 600, 750, 620, 450, 800, 550, 400, 700, 600];
            const labels = Array.from({length: 29}, (_, i) => i + 1);

            new Chart(arusCtx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Terkumpul',
                            data: terkumpulData,
                            borderColor: '#e8c643',
                            borderWidth: 1.8,
                            backgroundColor: 'transparent',
                            fill: false,
                            tension: 0.38,
                            pointRadius: 3,
                            pointBackgroundColor: '#e8c643',
                            pointBorderColor: '#fff',
                            pointBorderWidth: 1.2,
                            pointHoverRadius: 5,
                            animation: {
                                duration: 2000,
                                easing: 'easeInOutQuart'
                            }
                        },
                        {
                            label: 'Tersalurkan',
                            data: tersalurkanData,
                            borderColor: '#855cb8',
                            borderWidth: 1.8,
                            backgroundColor: 'transparent',
                            fill: false,
                            tension: 0.38,
                            pointRadius: 3,
                            pointBackgroundColor: '#855cb8',
                            pointBorderColor: '#fff',
                            pointBorderWidth: 1.2,
                            pointHoverRadius: 5,
                            animation: {
                                duration: 2000,
                                easing: 'easeInOutQuart'
                            }
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    animation: {
                        duration: 2000,
                        easing: 'easeInOutQuart'
                    },
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            backgroundColor: '#2b144b',
                            titleFont: { family: 'Plus Jakarta Sans', size: 11, weight: '700' },
                            bodyFont: { family: 'Plus Jakarta Sans', size: 12, weight: '600' },
                            padding: 9,
                            cornerRadius: 8
                        }
                    },
                    scales: {
                        x: {
                            grid: { color: 'rgba(200,185,225,0.3)', drawBorder: false },
                            ticks: { color: '#888', font: { family: 'Plus Jakarta Sans', size: 10, weight: '600' }, maxRotation: 0 },
                            border: { display: false }
                        },
                        y: {
                            grid: { color: 'rgba(200,185,225,0.3)', drawBorder: false },
                            ticks: { color: '#888', font: { family: 'Plus Jakarta Sans', size: 10, weight: '600' }, stepSize: 250 },
                            border: { display: false },
                            min: 0,
                            max: 1000
                        }
                    }
                }
            });

            // --- AKTIVITAS DANA Grouped Bar Chart ---
            const aktCtx = document.getElementById('aktivitasChart').getContext('2d');

            new Chart(aktCtx, {
                type: 'bar',
                data: {
                    labels: ['0', '1', '2', '3', '4', '5', '6', '7'],
                    datasets: [
                        {
                            label: 'Pemasukan',
                            data: [0, 85, 100, 55, 70, 15, 30, 0],
                            backgroundColor: '#855cb8',
                            borderRadius: 6,
                            barThickness: 18,
                            borderSkipped: false,
                            animation: {
                                duration: 2000,
                                easing: 'easeInOutQuart'
                            }
                        },
                        {
                            label: 'Pencairan',
                            data: [0, 40, 65, 80, 35, 75, 15, 0],
                            backgroundColor: '#e8c643',
                            borderRadius: 6,
                            barThickness: 18,
                            borderSkipped: false,
                            animation: {
                                duration: 2000,
                                easing: 'easeInOutQuart'
                            }
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    animation: {
                        duration: 2000,
                        easing: 'easeInOutQuart'
                    },
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            backgroundColor: '#2b144b',
                            titleFont: { family: 'Plus Jakarta Sans', size: 11, weight: '700' },
                            bodyFont: { family: 'Plus Jakarta Sans', size: 12, weight: '600' },
                            padding: 9,
                            cornerRadius: 8
                        }
                    },
                    scales: {
                        x: {
                            grid: { display: false },
                            ticks: { color: '#888', font: { family: 'Plus Jakarta Sans', size: 10, weight: '600' } },
                            border: { display: false }
                        },
                        y: {
                            grid: { color: 'rgba(200,185,225,0.3)', drawBorder: false },
                            ticks: { color: '#888', font: { family: 'Plus Jakarta Sans', size: 10, weight: '600' }, stepSize: 25 },
                            border: { display: false },
                            min: 0,
                            max: 100
                        }
                    }
                }
            });
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

