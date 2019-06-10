#=
NonlinearFittingTests:
- Julia version: 1.0
- Author: qz
- Date: Jan 29, 2019
=#
module NonlinearFittingTests

using Test

using EquationsOfState

@testset "Test data from Pymatgen" begin
    # Data is from https://github.com/materialsproject/pymatgen/blob/1f0957b8525ddc7d12ea348a19caecebe6c7ff34/pymatgen/analysis/tests/test_eos.py
    volumes = [
        25.987454833, 26.9045702104, 27.8430241908,
        28.8029649591, 29.7848370694, 30.7887887064,
        31.814968055, 32.8638196693, 33.9353435494,
        35.0299842495, 36.1477417695, 37.2892088485,
        38.4543854865, 39.6437162376, 40.857201102,
        42.095136449, 43.3579668329, 44.6456922537,
        45.9587572656, 47.2973100535, 48.6614988019,
        50.0517680652, 51.4682660281, 52.9112890601,
        54.3808371612, 55.8775030703, 57.4014349722,
        58.9526328669
    ]
    energies = [
        -7.63622156576, -8.16831294894, -8.63871612686,
        -9.05181213218, -9.41170988374, -9.72238224345,
        -9.98744832526, -10.210309552, -10.3943401353,
        -10.5427238068, -10.6584266073, -10.7442240979,
        -10.8027285713, -10.8363890521, -10.8474912964,
        -10.838157792, -10.8103477586, -10.7659387815,
        -10.7066179666, -10.6339907853, -10.5495538639,
        -10.4546677714, -10.3506386542, -10.2386366017,
        -10.1197772808, -9.99504030111, -9.86535084973,
        -9.73155247952
    ]
    @test isapprox(fit_energy(Birch(40, 0.5, 4, 0), volumes, energies), Birch(40.98926572870838, 0.5369258244952931, 4.178644231838501, -10.8428039082307))
    @test isapprox(fit_energy(BirchMurnaghan3rd(40, 0.5, 4, 0), volumes, energies), BirchMurnaghan3rd(40.98926572528106, 0.5369258245417454, 4.178644235500821, -10.842803908240892))
    @test isapprox(fit_energy(Murnaghan(41, 0.5, 4, 0), volumes, energies), Murnaghan(41.13757930387086, 0.5144967693786603, 3.9123862262572264, -10.836794514626673))
    @test isapprox(fit_energy(PoirierTarantola3rd(41, 0.5, 4, 0), volumes, energies), PoirierTarantola3rd(40.86770643373908, 0.5667729960804602, 4.331688936974368, -10.851486685041658))
    @test isapprox(fit_energy(Vinet(41, 0.5, 4, 0), volumes, energies), Vinet(40.916875663779784, 0.5493839425156859, 4.3051929654936885, -10.846160810560756))
# 'deltafactor': {'b0': 0.5369258245611414,
#             'b1': 4.178644231924639,
#             'e0': -10.842803908299294,
#             'v0': 40.989265727927936},
# 'numerical_eos': {'b0': 0.5557257614101998,
#             'b1': 4.344039148405489,
#             'e0': -10.847490826530702,
#             'v0': 40.857200064982536},
# }
end

end