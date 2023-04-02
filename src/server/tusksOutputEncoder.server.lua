local dfkey = { 135, 53, 31, 93, 52, 68, 23, 93, 99, 66, 66, 66, 66, 32 }
    local function decrypt(num, p4, div)
        local t = 0
        for v in p4:gmatch(".") do
            t = t + v:byte()
        end
        local val = tonumber(num) / t / div
        return string.char(val)
    end
    outputDecode(bytes,key)
        key = key or dfkey
        local out = {}
        for n,otherstr in bytes:gmatch("{(%d+)|([^}]+)}") do
            table.insert(out,decrypt(n, otherstr, key[(#out + 1) % #key + 1]))
        end
        return table.concat(out)
    end
    local function encrypt(tostr,numb,divthing)
        local nstr = "{"
        local t = 0
        for i = 1,#tostr do t = t + (tostr:sub(i,i):byte()) end
        nstr = nstr..tostring(t * numb * divthing)
        nstr = nstr.."|"
        nstr = nstr..tostr
        nstr = nstr.."}"
        return nstr
    end
    outputEncode(bytes,key,otherstr)
        key = key or dfkey
        local bytes_t = {}
        for i = 1,#bytes do
            bytes_t[i] = bytes:sub(i,i):byte()
        end
        local out = {}
        for _,v in pairs(bytes_t) do
            table.insert(out,encrypt(otherstr,v,key[(#out + 1) % #key + 1]))
        end
        return table.concat(out)
    end
	--print(outputDecode("{3072251|=+-=BeaC`} {1472562|bDBDdz} {547026|bK} {3682848|BebeaAD+Bch} {6415800|Eab-eCEF+eZ} {584706|ez} {1905756|Fv} {1200375|f} {1896048|FD-S} {1846812|dE==EBBa=Cj} {769560|=Ae&} {626076|+FcC} {2953440|E-fDeeBb=Ag} {15416325|D=c+A-accACbW} {488342|cfF} {488312|BCdB;} {4994844|CCfF=`} {5596032|ebaefaAd+=O} {3126708|ddf[} {508737|==a} {5163453|ccfc-e4} {2461140|ffEBcD;} {714714|w} {1925352|Ad-caEFfbq} {1235520|ab-} {6959700|C+BDb==daaA=B} {554496|d4} {12654900|DBedf=EA+Bw} {3341650|BEA=EdEe2} {1556820|bAcef} {1384956|fabEH} {1089088|--Bb+dO} {2272696|aAbB=-CfDAbAV} {1243242|dEFFcFD} {7866126|E+bebAbBD8} {9879408|-eCD+Acb-af=} {6947820|edFBaFEf=b$} {1498992|e+dCCCAc;} {319440|n} {2970528|EFed0} {3337920|=fbdd+Edcb-} {11309220|+A-EAdAabE} {2473086|CCbaE@} {2730201|B=c+fCCfdDCi} {2655708|b+adF=cQ} {3165708|D+ccB=FAb} {1190680|aFaba8} {340860|eY} {10054602|EbBCda-C=ADDg} {5959008|=BAAecG} {2287692|e=EW} {3585120|-F=AAea8} {6842880|DfcBf+=cEBDu} {1148928|caC=Bz} {435072|fCDH} {1794690|E=dd=} {2633040|=+a=Fb} {887065|Cc-T} {4759275|DCEACm} {850824|e=} {3341112|bC-dy} {250240|ABb[} {2483844|cd==ffR} {3916044|eeb)} {5951484|A-a-cbdea,} {5374512|--FaFCFBf@} {4492884|FBCADebBI} {6052068|dc+Fd=BFBdFc*} {699776|=aDfdE} {2481570|F=G} {214438|w} {800358|e-dU} {4758903|cEAaE>} {4208880|cEFEFbAFd} {3038920|dcACO} {1343062|F+acad`} {6197148|eEB=aFa8} {3288582|+Fd=FfabbeAH} {1559448|cF-b--b%} {2219316|cFf=deBbAfd} {2273964|Ca=a} {7034940|+fEfE+DCCB-c=D} {1169280|bdb4} {6361740|+b=B=F?} {2564087|b-AdbI} {118048|p} {2438832|b+fbBdY} {2672176|EFCaAK} {1054272|=K} {1660347|E++E-B=BEV} {8425521|dFdEbaAbCBC} {4980987|bd-+f+n} {813120|Dbr}"))
	--output: [["Normal","is",true],["Normal","copy",true],["Normal","laser",true],["Normal","knife",true],
	local t = Instance.RawNew("StringValue",nil,{Name = "SB_Output:Output",
		Value = terminal.outputEncode('["Note","Got no localscripts"]')})
	lib.Destroy(t,2)
	t.Parent = owner