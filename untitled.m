function ...
[total_pop, network_pop, network_density, ...
 pedestrians, Aped, Aped_km2, Cped_km2, ...
 vehicular, Aveh, Aveh_km2, Cveh_km2, ...
 in_buildings, Abui, Abui_km2, Cbui_km2, ...
 Dpedestrians, Dpedestrians_vol, Dped_km2, ...
 Dvehicular, Dvehicular_vol, Dveh_km2, ...
 Din_buildings, Din_buildings_vol, Dbui_km2, ...
 AGSM900, AGSM1800, A3G_cell, Ncc, Ncc_real, ...
 channels_GSM900, channels_GSM1800,...
 channels_cell_GSM900, channels_cell_GSM1800, channels_cell_3G, AGSM900_cell, AGSM1800_cell, ...
 clusters_macro_gsm900_km2, cells_macro_gsm900_km2, clusters_macro_gsm900, cells_macro_gsm900, ...
 cells_macro_3g_km2, cells_macro_3g, cells_macro_lte_km2, cells_macro_lte, ...
 Area_macrocell_gsm900, Area_macrocell_3g, Area_macrocell_lte, Radius_macrocell_gsm900, Radius_macrocell_3g, Radius_macrocell_lte, ...
 clusters_micro_gsm1800_km2, cells_micro_gsm1800_km2, clusters_micro_gsm1800, cells_micro_gsm1800, ...
 cells_micro_3g_km2, cells_micro_3g, cells_micro_lte_km2, cells_micro_lte, ...
 Area_microcell_gsm1800, Area_microcell_3g, Area_microcell_lte, Radius_microcell_gsm1800, Radius_microcell_3g, Radius_microcell_lte, ...
 Lfs_macro_gsm900, Lfs_macro_3g, Lfs_macro_lte, Lfs_micro_gsm1800, Lfs_micro_3g, Lfs_micro_lte, ...
 Lb_macro_gsm900, Lb_macro_3g, Lb_macro_lte, Lb_micro_gsm1800, Lb_micro_3g, Lb_micro_lte, ...
 Ptx_macro_gsm900, Ptx_macro_3g, Ptx_macro_lte, Ptx_micro_gsm1800, Ptx_micro_3g, Ptx_micro_lte, Gtx_out] ...
 = untitled(n, area, population_density, penetration, carriers_GSM900, carriers_GSM1800, ...
            signalling_channels, Pb, CI, Lfading, extra_traffic, capacity_3g, capacity_lte, ...
            voice_data_equiv, sectorization, lte_enabled, w, b, hbase_macro, hbase_micro, ...
            hroof, hmobile, Grx, Srx, Gtx, t1, t2, tcarriers)

% area = 64 % km^2
% population_density = 31243 % density / km^2
% penetration = 0.3
% carriers_GSM900 = 40
% carriers_GSM1800 = 30
% signaling_channels = 1 % or 2
% Pb = 0.01
% CI = 12 % dB
CI_linear = 10^(CI/10) % dB
% n = 4
% cell_coverage = 0.95
% Lfading = 13.6 % dB for sigma=8dB
% extra_traffic = 0.3 % 30%
% capacity_lte = 100e6 % bps
% capacity_3g = 14e6 % bps
% voice_data_equiv = 30e3 % bps
freq_gsm900 = 900
freq_gsm1800 = 1800
freq_3g = 2100
freq_lte_macro = 2600
freq_lte_micro = 800

% Total population
total_pop = population_density * area
network_pop = total_pop * penetration
network_density = population_density * penetration

%%%%%%%%%% table 1 - voice traffic %%%%%%%%%%
pedestrians = t1(1,1) * network_density
pedestrians_lambda = t1(1,2) % average call rate / h
pedestrians_tau = t1(1,3) % average call duration (s)
Aped = pedestrians_lambda * 1/3600 * pedestrians_tau % Erl/user
Aped_km2 = Aped * pedestrians  * (1+extra_traffic) % Erl/km2
Cped_km2 = erlangbinv(Pb, Aped_km2)

vehicular = t1(2,1) * network_density
vehicular_lambda = t1(2,2) % average call rate / h
vehicular_tau = t1(2,3) % average call duration (s)
Aveh = vehicular_lambda * 1/3600 * vehicular_tau % Erl/user
Aveh_km2 = Aveh * vehicular * (1+extra_traffic) % Erl/km2
Cveh_km2 = erlangbinv(Pb, Aveh_km2)

in_buildings = t1(3,1) * network_density
in_buildings_lambda = t1(3,2) % average call rate / h
in_buildings_tau = t1(3,3) % average call duration (s)
Abui = in_buildings_lambda * 1/3600 * in_buildings_tau % Erl/user
Abui_km2 = Abui * in_buildings * (1+extra_traffic) % Erl/km2
Cbui_km2 = erlangbinv(Pb, Abui_km2)

%%%%%%%%%% table 2 - data traffic %%%%%%%%%%
Dpedestrians = t2(1,1) * network_density
Dpedestrians_vol = t2(1,2) % bytes/hour/user
Dped_km2 = Dpedestrians * Dpedestrians_vol * 8/3600 * (1+extra_traffic) % bps/km2

Dvehicular = t2(2,1) * network_density
Dvehicular_vol = t2(2,2) % bytes/hour/user
Dveh_km2 = Dvehicular * Dvehicular_vol * 8/3600 * (1+extra_traffic) % bps/km2

Din_buildings = 0.25 * network_density 
Din_buildings_vol = 35e6 % bytes/hour/user
Dbui_km2 = Din_buildings * Din_buildings_vol * 8/3600 * (1+extra_traffic) % bps/km2

% Number of cells/cluster based on C/I
if sectorization
    interferers = 3
else
    interferers = 6
end
Ncc = (CI_linear * interferers)^(2/n) / 3
if Ncc <=3
    Ncc_real = 3
elseif 3 < Ncc <= 4
    Ncc_real = 4
elseif 4 < Ncc <= 7
    Ncc_real = 7
else
    Ncc_real = -1
    error('Ncc invalid')
end

channels_GSM900 = carriers_GSM900 * 8 - Ncc_real * signalling_channels
channels_GSM1800 = carriers_GSM1800 * 8 - Ncc_real * signalling_channels
AGSM900 = findrhob(0.01, channels_GSM900) % 296.71
AGSM1800 = findrhob(0.01, channels_GSM1800) % 218.56
% channels_cell_GSM900 = channels_GSM900 / Ncc_real - signalling_channels
% channels_cell_GSM1800 = channels_GSM1800 / Ncc_real - signalling_channels
channels_cell_GSM900 = channels_GSM900 / Ncc_real
channels_cell_GSM1800 = channels_GSM1800 / Ncc_real
% AGSM900_cell = findrhob(0.01, channels_cell_GSM900) % 120.09
% AGSM1800_cell = findrhob(0.01, channels_cell_GSM1800) % 86.88
AGSM900_cell = AGSM900 / Ncc_real
AGSM1800_cell = AGSM1800 / Ncc_real

channels_cell_3G = tcarriers(3,1)*capacity_3g / voice_data_equiv - signalling_channels
A3G_cell = findrhob(0.01, channels_cell_3G)

%%%%%%%%%% Planning %%%%%%%%%%
% macro clusters (voice vehicular: GSM 900)
clusters_macro_gsm900_km2 = Aveh_km2 / AGSM900
cells_macro_gsm900_km2 = clusters_macro_gsm900_km2 * Ncc_real
clusters_macro_gsm900 = ceil(clusters_macro_gsm900_km2 * area)
cells_macro_gsm900 = clusters_macro_gsm900 * Ncc_real
% macro clusters (data vehicular: 1*LTE 10 MHz + 1*3G 5 MHz)
cells_macro_3g_km2 = (Dveh_km2)*(1-lte_enabled) / (tcarriers(2,1)*capacity_3g)
cells_macro_3g = ceil(cells_macro_3g_km2 * area)
cells_macro_lte_km2 = (Dveh_km2)*lte_enabled / (tcarriers(2,2)*capacity_lte)
cells_macro_lte = ceil(cells_macro_lte_km2 * area)

Area_macrocell_gsm900 = 1/cells_macro_gsm900_km2
Area_macrocell_3g = 1/cells_macro_3g_km2
Area_macrocell_lte = 1/cells_macro_lte_km2

Radius_macrocell_gsm900 = sqrt(Area_macrocell_gsm900 / (3*sqrt(3)/2))
Radius_macrocell_3g = sqrt(Area_macrocell_3g / (3*sqrt(3)/2))
Radius_macrocell_lte = sqrt(Area_macrocell_lte / (3*sqrt(3)/2))

% micro clusters (voice pedestrians+buildings: GSM 1800 + 1*3G de 5 MHz)
clusters_micro_gsm1800_km2 = (Aped_km2+Abui_km2)/(AGSM1800+A3G_cell)
cells_micro_gsm1800_km2 = clusters_micro_gsm1800_km2 * Ncc_real
clusters_micro_gsm1800 = ceil(clusters_micro_gsm1800_km2 * area)
cells_micro_gsm1800 = clusters_micro_gsm1800 * Ncc_real
% micro clusters (data pedestrians+buildings: 1*LTE 20 MHz + 2*3G 5 MHz)
cells_micro_3g_km2 = (Dped_km2+Dbui_km2)*(1-lte_enabled) / (tcarriers(4,1)*capacity_3g)
cells_micro_3g = ceil(cells_micro_3g_km2 * area)
cells_micro_lte_km2 = (Dped_km2+Dbui_km2)*(lte_enabled) / (tcarriers(4,2)*capacity_lte) 
cells_micro_lte = ceil(cells_micro_lte_km2 * area)

Area_microcell_gsm1800 = 1/cells_micro_gsm1800_km2
Area_microcell_3g = 1/cells_micro_3g_km2
Area_microcell_lte = 1/cells_micro_lte_km2

Radius_microcell_gsm1800 = sqrt(Area_microcell_gsm1800 / (3*sqrt(3)/2))
Radius_microcell_3g = sqrt(Area_microcell_3g / (3*sqrt(3)/2))
Radius_microcell_lte = sqrt(Area_microcell_lte / (3*sqrt(3)/2))

%%%%%%%%%% Propagation models %%%%%%%%%%
% Free space
Lfs_macro_gsm900 = 32.4 + 20*log10(Radius_macrocell_gsm900) + 20*log10(freq_gsm900) + Lfading
Lfs_macro_3g = 32.4 + 20*log10(Radius_macrocell_3g) + 20*log10(freq_3g) + Lfading
Lfs_macro_lte = 32.4 + 20*log10(Radius_macrocell_lte) + 20*log10(freq_lte_macro) + Lfading

Lfs_micro_gsm1800 = 32.4 + 20*log10(Radius_microcell_gsm1800) + 20*log10(freq_gsm1800) + Lfading
Lfs_micro_3g = 32.4 + 20*log10(Radius_microcell_3g) + 20*log10(freq_3g) + Lfading
Lfs_micro_lte = 32.4 + 20*log10(Radius_microcell_lte) + 20*log10(freq_lte_micro) + Lfading
% Okumura-Hata
% base station and mobile unit heights
% hbe = 30 % m
% hmu =1.5 % m
% Lokumura_900 = 69.55 + 26.16*log10(900) - 13.82*log10(hbe) + (44.9 -6.55*log10(hbe))*log10(d)
% Lokumura_1800 = 69.55 + 26.16*log10(1800) - 13.82*log10(hbe) + (44.9 -6.55*log10(hbe))*log10(d)
% Ltotal_900 = Lokumura_900 + Lfading
% Ltotal_1800 = Lokumura_1800 + Lfading

% Walfisch-Ikegami (COST 231)
% w = 10 % street width
% b = 17 % distance between center of buildings
% hbase_macro = 40 % 1base station height
% hbase_micro = 15 % base station height
% hroof = 20 % roof height
% hmobile = 1.3 % mobile subscriber height
deltamobile = hroof - hmobile 
deltabase_macro = hbase_macro - hroof
deltabase_micro = hbase_micro - hroof
Lori = 2.5 + 0.075*(45 - 35) % phi=45 degrees
Lbsh_macro = -18*log10(1 + 20) % for hbase > hroof
Lbsh_micro = 0 % for hbase <= hroof
kd_macro = 18 % for hbase > hroof
kd_micro = 18 - 15*deltabase_micro/hroof % for hbase <= hroof
ka_macro = 54 % for hbase > hroof
kf_gsm900 = -4 + 1.5*((freq_gsm900/925) -1) % for metropolitan centers
kf_gsm1800 = -4 + 1.5*((freq_gsm1800/925) -1) % for metropolitan centers
kf_3g = -4 + 1.5*((freq_3g/925) -1) % for metropolitan centers
kf_lte_macro = -4 + 1.5*((freq_lte_macro/925) -1) % for metropolit+an centers
kf_lte_micro = -4 + 1.5*((freq_lte_micro/925) -1) % for metropolitan centers

Lrts_macro_gsm900 = -16.9 -10*log10(w) + 10*log10(freq_gsm900) + 20*log10(deltamobile) + Lori
Lmsd_macro_gsm900 = Lbsh_macro + ka_macro + kd_macro*log10(Radius_macrocell_gsm900) +kf_gsm900*log10(freq_gsm900)-9*log10(b)
Lb_macro_gsm900 = Lfs_macro_gsm900 + Lrts_macro_gsm900 + Lmsd_macro_gsm900

Lrts_macro_3g = -16.9 -10*log10(w) + 10*log10(freq_3g) + 20*log10(deltamobile) + Lori
Lmsd_macro_3g = Lbsh_macro + ka_macro + kd_macro*log10(Radius_macrocell_3g) +kf_3g*log10(freq_3g)-9*log10(b)
Lb_macro_3g = Lfs_macro_3g + Lrts_macro_3g + Lmsd_macro_3g

Lrts_macro_lte = -16.9 -10*log10(w) + 10*log10(freq_lte_macro) + 20*log10(deltamobile) + Lori
Lmsd_macro_lte = Lbsh_macro + ka_macro + kd_macro*log10(Radius_macrocell_lte) +kf_lte_macro*log10(freq_lte_macro)-9*log10(b)
Lb_macro_lte = Lfs_macro_lte + Lrts_macro_lte + Lmsd_macro_lte

ka_micro1 = 54 - 0.8*deltabase_micro % for hbase <= hroof && radius >= 0.5 km
Lrts_micro_gsm1800 = -16.9 -10*log10(w) + 10*log10(freq_gsm1800) + 20*log10(deltamobile) + Lori
Lmsd_micro_gsm1800 = Lbsh_micro + ka_micro1 + kd_micro*log10(Radius_microcell_gsm1800) +kf_gsm1800*log10(freq_gsm1800)-9*log10(b)
Lb_micro_gsm1800 = Lfs_micro_gsm1800 + Lrts_micro_gsm1800 + Lmsd_micro_gsm1800

ka_micro_3g = 54 - 0.8*deltabase_micro*Radius_microcell_3g/0.5 % for hbase <= hroof && radius < 0.5 km
Lrts_micro_3g = -16.9 -10*log10(w) + 10*log10(freq_3g) + 20*log10(deltamobile) + Lori
Lmsd_micro_3g = Lbsh_micro + ka_micro_3g + kd_micro*log10(Radius_microcell_3g) +kf_3g*log10(freq_3g)-9*log10(b)
Lb_micro_3g = Lfs_micro_3g + Lrts_micro_3g + Lmsd_micro_3g

ka_micro_lte = 54 - 0.8*deltabase_micro*Radius_microcell_lte/0.5 % for hbase <= hroof && radius < 0.5 km
Lrts_micro_lte = -16.9 -10*log10(w) + 10*log10(freq_lte_micro) + 20*log10(deltamobile) + Lori
Lmsd_micro_lte = Lbsh_micro + ka_micro_lte + kd_micro*log10(Radius_microcell_lte) +kf_lte_micro*log10(freq_lte_micro)-9*log10(b)
Lb_micro_lte = Lfs_micro_lte + Lrts_micro_lte + Lmsd_micro_lte

Gtx_omni = 5 % dBi
Gtx_sector = 20 % dBi
if Gtx == 1
    Gtx_out = Gtx_omni
else
    Gtx_out = Gtx_sector
%     Ptx_macro_gsm900_sector = Srx + Lb_macro_gsm900 - Gtx_sector - Grx % dBm
%     Ptx_macro_3g_sector = Srx + Lb_macro_3g - Gtx_sector - Grx % dBm
%     Ptx_macro_lte_sector = Srx + Lb_macro_lte - Gtx_sector - Grx % dBm
%     Ptx_micro_gsm1800_sector = Srx + Lb_micro_gsm1800 - Gtx_sector - Grx % dBm
%     Ptx_micro_3g_sector = Srx + Lb_micro_3g - Gtx_sector - Grx % dBm
%     Ptx_micro_lte_sector = Srx + Lb_micro_lte - Gtx_sector - Grx % dBm
end
Ptx_macro_gsm900 = Srx + Lb_macro_gsm900 - Gtx_out - Grx % dBm
Ptx_macro_3g = Srx + Lb_macro_3g - Gtx_out - Grx % dBm
Ptx_macro_lte = Srx + Lb_macro_lte - Gtx_out - Grx % dBm
Ptx_micro_gsm1800 = Srx + Lb_micro_gsm1800 - Gtx_out - Grx % dBm
Ptx_micro_3g = Srx + Lb_micro_3g - Gtx_out - Grx % dBm
Ptx_micro_lte = Srx + Lb_micro_lte - Gtx_out - Grx % dBm
% Grx = 2 % dBi
% Srx = -110 % dBm





